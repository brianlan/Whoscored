select 
    a.player_name,
    a.team_name, 
    a.pos_cur_match, 
    a.num_presents,
    -- round((case when b.num_interceptions is null then 0 else b.num_interceptions end) / a.num_presents,2) as interception_per_match, 
    -- round((case when b.num_tackles is null then 0 else b.num_tackles end) / a.num_presents,2) as tackle_per_match,
    round((case when b.num_interceptions is null then 0 else b.num_interceptions end + case when b.num_tackles is null then 0 else b.num_tackles end) / a.num_presents, 2) as def_act_per_match,
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
order by def_act_per_match;


select 
    player_id, 
    count(distinct substr(pos_cur_match,1,1)) as num_pos 

from (
    select player_id, pos_cur_match, count(*) times
    from player_stats
    where pos_cur_match <> 'Sub'
    group by 1,2
    having times >= 3) as a
group by 1 
having num_pos >= 4
order by 2;

select player_name, player_id, team_name, pos_cur_match, count(*) times from player_stats where player_id in (5641,8058,13812) group by 1,2,3,4 having times >=3;
