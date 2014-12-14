#!/usr/bin/python

import pattern.web as web
import pandas as pd
import numpy as np
import re
import ast
import os
import sqlite3
from sets import Set

def get_team_var_set(url, var_set):
    tmp_html = web.URL(url).download(cached=False)
    regM = re.search('href="(/Matches.{1,128}?)".{1,10}Match Centre', tmp_html, re.DOTALL)
    match_centre_url = 'http://www.whoscored.com' + regM.group(1)
    player_stats_url = match_centre_url.replace('Live', 'LiveStatistics')

    html = web.URL(player_stats_url).download(cached=False)
    regM = re.search('var initialData = (.*?);', html, re.DOTALL)
    data = regM.group(1)

    while ',,' in data:
        data = data.replace(',,', ",' ',")

    data = ast.literal_eval(data)

    match_overview = data[0][0]
    match_details = data[0][1]

    print match_overview[2], match_overview[3]

    for team in match_details:
        team_stats = team[3]

        for var in team_stats[0]:
            var_set.add(var[0])


def get_player_var_set(url, var_set):
    tmp_html = web.URL(url).download(cached=False)
    regM = re.search('href="(/Matches.{1,128}?)".{1,10}Match Centre', tmp_html, re.DOTALL)
    match_centre_url = 'http://www.whoscored.com' + regM.group(1)
    player_stats_url = match_centre_url.replace('Live', 'LiveStatistics')

    html = web.URL(player_stats_url).download(cached=False)
    regM = re.search('var initialData = (.*?);', html, re.DOTALL)
    data = regM.group(1)

    while ',,' in data:
        data = data.replace(',,', ",' ',")

    data = ast.literal_eval(data)

    match_overview = data[0][0]
    match_details = data[0][1]

    print match_overview[2], match_overview[3]

    for team in match_details:
        player_stats = team[4]

        for p in player_stats:
            for var in p[3][0]:
                var_set.add(var[0])


def scrape_single_match(league_name, season, url, match_id, db_cur, conn):
    tmp_html = web.URL(url).download(cached=False)
    regM = re.search('href="(/Matches.{1,128}?)".{1,10}Match Centre', tmp_html, re.DOTALL)
    match_centre_url = 'http://www.whoscored.com' + regM.group(1)
    player_stats_url = match_centre_url.replace('Live', 'LiveStatistics')

    html = web.URL(player_stats_url).download(cached=False)
    regM = re.search('var initialData = (.*?);', html, re.DOTALL)
    data = regM.group(1)

    while ',,' in data:
        data = data.replace(',,', ",' ',")

    data = ast.literal_eval(data)

    match_overview, match_details = data[0][0:2]
    match_time = match_overview[4]

    print match_overview[4], ':  ', match_overview[2], ' vs. ', match_overview[3], ',  ', match_overview[12]

    for idx, team in enumerate(match_details):
        is_home_team = 'Y' if idx == 0 else 'N'
        team_id = team[0]
        team_name = team[1]

        player_stats = team[4]

        for player in player_stats:
            sql_stat = 'replace into player_stats(league_name,season,match_id,match_time,is_home_team,team_id,team_name,player_id,player_name,player_score,pos_category,pos_cur_match,substitution_flag,substitution_minute'

            player_id = player[0]
            player_name, player_score = player[1:3]

            pos_category, pos_cur_match = player[4:6]
            substitution_flag, substitution_minute = player[7:9]

            player_stats_detail = player[3][0]
            var_name_list = [var[0] for var in player_stats_detail]

            # check if there is variable doesn't exist in current table. If not, add new column.
            var_name_set = set(var_name_list)
            table_schema = db_cur.execute('PRAGMA table_info(player_stats);').fetchall()
            existing_var_list = [row[1] for row in table_schema]
            existing_var_set = set(existing_var_list)

            if not var_name_set.issubset(existing_var_set):
                new_vars = var_name_set.difference(existing_var_set)
                for v in new_vars:
                    db_cur.execute('alter table player_stats add column {0} float;'.format(v))
                    print 'Add New Variable: {0}'.format(v)

            var_name_str = ','+','.join(var_name_list)
            var_value_str = ','+','.join(["'"+var[1][0]+"'" if isinstance(var[1][0],str) else str(var[1][0]) for var in player_stats_detail])

            sql_stat = sql_stat + var_name_str + ") values('{0}','{1}',{2},'{3}','{4}',{5},'{6}',{7},'{8}',{9},{10},'{11}',{12},{13}".format(league_name.replace("'"," "),season,match_id,match_time,is_home_team,team_id,team_name.replace("'"," "),player_id,player_name.replace("'"," "),player_score,pos_category,pos_cur_match,substitution_flag,substitution_minute) + var_value_str + ");"

            db_cur.execute(sql_stat)

    conn.commit()
    # test
    # tmp_url = 'http://www.whoscored.com/Matches/738819/LiveStatistics/Spain-La-Liga-2013-2014-Barcelona-Atletico-Madrid'

    # html = web.URL(tmp_url).download(cached=False)
    # regM = re.search('var initialData = (.*?);', html, re.DOTALL)
    # data = regM.group(1)

    # while ',,' in data:
    #     data = data.replace(',,', ",' ',")

    # data = ast.literal_eval(data)

    # for p in data[0][1][0][4]:
    #     print p[0:3], p[4:]
    # end of test

    # return html

seed_url = 'http://www.whoscored.com/Regions/252/Tournaments/2/Seasons/3389'
# start_week_num = 49 # 1-7 Dec 2014
start_week_num = 33
num_weeks = 1

html = web.URL(seed_url).download(cached=False)

regM = re.search("<h1>(.*?)</h1>", html, re.DOTALL)
league_name = regM.group(1)

regM = re.search("img/customstageheaders/(\d+)\.jpg", html, re.DOTALL)
league_season_id = regM.group(1)

regM = re.search("min = new Date\((\d+),", html, re.DOTALL)
start_year = int(regM.group(1))

# outfile = open('premier-league-2013-2014.txt', 'wb')
# var_set = Set()
conn = sqlite3.connect('whoscored.db')
db_cur = conn.cursor()
for i in range(start_week_num, start_week_num + num_weeks):
    y = start_year + i / 52
    w = i % 52
    ajax_request_url = 'http://www.whoscored.com/tournamentsfeed/'+league_season_id+'/Fixtures/?d='+str(y)+'W'+str(w)+'&isAggregate=false'
    ajax_return_str = web.URL(ajax_request_url).download(cached=False)
    matches_of_week = ast.literal_eval(ajax_return_str)

    if matches_of_week != '[]':
        for m in matches_of_week:
            match_id = m[0]
            match_url = 'http://www.whoscored.com/Matches/' + str(match_id) + '/MatchReport'
            print str(y) + '-W' + str(w) + ': ', match_url
            scrape_single_match(league_name, str(start_year)+'-'+str(start_year+1), match_url, match_id, db_cur, conn)

            # outfile.write(url+os.linesep)
            # get_player_var_set(url, var_set)

conn.close()
# print var_set
# outfile.close

