library(ggplot2)
library(RSQLite)
library(dplyr)

setwd('/Users/brianlan/Work/Whoscored/')
conn <- dbConnect(dbDriver("SQLite"), dbname="whoscored.db")

# 2013-2014 Premier League, interceptions vs. passes
df<-dbGetQuery(conn, 
"select 
  a.player_name,
  a.team_name, 
  a.pos_cur_match, 
  a.num_presents,
  round((case when b.num_interceptions is null then 0 else b.num_interceptions end + case when b.num_tackles is null then 0 else b.num_tackles end) / a.num_presents, 2) as def_per_match,
  round((case when b.num_passes is null then 0 else b.num_passes end) / a.num_presents, 2) as pass_per_match

from (
  select 
  player_name,
  team_name, 
  pos_cur_match, 
  count(*) as num_presents 
  from player_stats 
  where season = '2013-2014' --and substr(pos_cur_match,1,1) in ('A','F')
  group by 1,2,3 ) as a

left join (
  select 
  player_name, 
  team_name,
  pos_cur_match,
  sum(interception) as num_interceptions, 
  sum(total_tackle) as num_tackles,
  sum(total_pass) as num_passes
  from player_stats
  where season = '2013-2014' --and substr(pos_cur_match,1,1) in ('A','F')
  group by 1,2,3 ) as b

on a.player_name = b.player_name and a.pos_cur_match = b.pos_cur_match and a.team_name = b.team_name
where a.num_presents >= 5
order by def_per_match;")

# 2010-2014 Premier League - Players Progress
df<-dbGetQuery(conn, 
               "select 
               a.season,
               a.player_name,
               a.team_name, 
               a.pos_cur_match, 
               a.num_presents,
               round((case when b.num_interceptions is null then 0 else b.num_interceptions end + case when b.num_tackles is null then 0 else b.num_tackles end) / a.num_presents, 2) as def_per_match,
               round((case when b.num_passes is null then 0 else b.num_passes end) / a.num_presents, 2) as pass_per_match
               
               from (
               select 
               season,
               player_name,
               team_name, 
               pos_cur_match, 
               count(*) as num_presents 
               from player_stats 
               where 
                player_name in ('Wayne Rooney','David Silva')
                      and substr(pos_cur_match,1,2) in ('AM','MC','ML','MR','DM')
               group by 1,2,3,4 ) as a
               
               left join (
               select 
               season,
               player_name, 
               team_name,
               pos_cur_match,
               sum(interception) as num_interceptions, 
               sum(total_tackle) as num_tackles,
               sum(total_pass) as num_passes
               from player_stats
               where 
                player_name in ('Wayne Rooney','David Silva')
                      and substr(pos_cur_match,1,2) in ('AM','MC','ML','MR','DM')
               group by 1,2,3,4 ) as b
               
               on a.season = b.season and a.player_name = b.player_name and a.pos_cur_match = b.pos_cur_match and a.team_name = b.team_name
               where num_presents >= 3
               order by def_per_match;")

ggplot(df, aes(x=pass_per_match,y=def_per_match,group=pos_cur_match,colour=pos_cur_match)) + 
  geom_point(aes(size=num_presents),alpha=0.5,colour='black') + 
  geom_line() + 
  geom_text(data = df,aes(x=pass_per_match,y=def_per_match + 0.1, label=season, size=num_presents)) + 
  facet_wrap(~player_name)

dbDisconnect(conn)
