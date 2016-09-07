create table player_stats (
    league_name varchar(64),
    season varchar(16),
    match_id int,
    match_time datetime 'MM/DD/YYYY HH:MM:SS',
    is_home_team char(1),
    team_id int,
    team_name varchar(64),
    player_id int,
    player_name varchar(64), 
    player_score float,
    pos_category int,
    pos_cur_match varchar(8),
    substitution_flag int,
    substitution_minute int,
    rating float,
    
    shield_ball_oop float,
    won_contest float,
    
    
    
    saves float,
    
    clearance_off_line float,
    
    pass_inaccurate float,
    
    overrun float,
    
    
    post_scoring_att float,
    
    duel_won float,
    tackle_lost float,
    goal_assist float,
    
    
    touches float,
    
    total_final_third_passes float,
    keeper_claim_high_lost float,


    successful_put_through float,
    aerial_won float,
    
    dangerous_play float,
    
    
    successful_final_third_passes float,
    
    
    
    blocked_cross float,
    big_chance_missed float,
    
    
    
    duel_ground_won float,
    keeper_sweeper_lost float,
    ontarget_scoring_att float,
    long_pass_own_to_opp_success float,
    total_sub_off float,
    
    accurate_through_ball float,
    
    accurate_cross_nocorner float,
    total_sub_on float,
    
    passes_left float,
    
    lost_corners float,
    rating_offensive_points float,
    attempted_tackle_foul float,
    
    interception_won float,
    
    total_long_balls float,
    rating_defensive_points float,
    
    
    last_man_tackle float,
    cross_inaccurate float,
    
    
    
    
    
    
    
    total_keeper_sweeper float,
    
    
    
    
    effective_clearance float,
    was_fouled float,
    big_chance_created float,
    
    fouled_final_third float,
    
    yellow_card float,
    head_clearance float,
    dispossessed float,
    final_third_entries float,
    man_of_the_match float,
    
    total_contest float,
    crosses_18yard float,
    total_corners_intobox float,
    hit_woodwork float,
    goal_kicks float,
    
    
    
    accurate_flick_on float,
    six_yard_block float,
    
    
    
    
    keeper_throws float,
    won_corners float,
    keeper_pick_up float,
    
    accurate_keeper_throws float,
    rating_defensive float,
    dive_catch float,
    accurate_cross float,
    accurate_long_balls float,
    
    
    poss_lost_ctrl float,
    
    error_lead_to_goal float,
    fouls float,
    cross_not_claimed float,
    
    effective_head_clearance float,
    
    
    
    accurate_throws float,
    
    
    
    
    
    
    
    
    
    accurate_launches float,
    saved_obox float,
    duel_ground_lost float,
    second_yellow float,
    total_throws float,
    
    duel_lost float,
    dribble_lost float,
    
    
    
    
    
    
    total_tackle float,
    pass_backzone_inaccurate float,
    interception float,
    goal_fastbreak float,
    
    
    total_pull_back float,
    poss_lost_all float,
    ball_recovery float,
    
    gk_smother float,
    stand_save float,
    
    pass_longball_inaccurate float,
    rating_points float,
    passes_right float,
    effective_blocked_cross float,
    
    
    aerial_lost float,
    
    
    
    challenge_lost float,
    
    game_started float,
    own_goals float,
    goals float,
    total_high_claim float,
    total_scoring_att float,
    put_through float,
    corner_taken float,
    
    
    outfielder_block float,
    
    dive_save float,
    total_clearance float,
    unsuccessful_touch float,
    total_offside float,
    total_launches float,
    goals_openplay float,
    
    total_flick_on float,
    stand_catch float,
    shot_fastbreak float,
    big_chance_scored float,
    accurate_freekick_cross float,
    error_lead_to_shot float,
    long_pass_own_to_opp float,
    
    crosses_18yardplus float,
    punches float,
    
    
    diving_save float,
    
    
    
    blocked_scoring_att float,
    total_through_ball float,
    
    second_goal_assist float,
    freekick_cross float,
    
    
    saved_ibox float,
    accurate_goal_kicks float,
    

    
    hand_ball float,
    
    
    total_fastbreak float,
    total_cross_nocorner float,
    foul_throw_in float,
    won_tackle float,
    mins_played float,
    
    red_card float,
    accurate_corners_intobox float,
    
    
    formation_place float,
    
    accurate_pull_back float,
    
    
    accurate_layoffs float,
    
    
    pass_forwardzone_inaccurate float,
    pass_throughball_inacurate float,


    total_cross float,
    
    
    

    
    shot_off_target float,
    
    
    goal_normal float,
    position float,
    
    total_layoffs float,
    
    
    good_high_claim float,
    
    
    offside_provoked float,
    
    rating_offensive float,
    
    accurate_keeper_sweeper float,
    interceptions_in_box float,
    turnover float,
    
    keeper_claim_lost float,


    offtarget_att_assist float,
    ontarget_att_assist float,
    total_att_assist float,    
    
    
    
    
    
    
    successful_open_play_pass float,
    blocked_pass float,
    rightside_pass float,
    head_pass float,
    fwd_pass float,
    open_play_pass float,
    leftside_pass float,
    backward_pass float,

    accurate_chipped_pass float,
    accurate_pass float,
    accurate_back_zone_pass float,
    accurate_fwd_zone_pass float,

    total_pass float,
    total_chipped_pass float,
    total_back_zone_pass float,
    total_fwd_zone_pass float,


    att_assist_setplay float,
    att_assist_openplay float,

    att_fastbreak float,
    att_one_on_one float,
    att_openplay float,
    att_obp_goal float,
    att_setpiece float,

    att_freekick_total float,
    att_freekick_goal float,
    att_freekick_miss float,
    att_freekick_target float,
    att_freekick_post float,

    
    goal_assist_deadball float,
    goal_assist_intentional float,
    goal_assist_openplay float,
    goal_assist_setplay float,

    
    attempts_conceded_obox float,
    attempts_conceded_ibox float,
    
    
    assist_blocked_shot float,
    assist_post float,
    assist_penalty_won float,    
    assist_handball_won float,
    assist_pass_lost float,
    assist_own_goal float,
    assist_attempt_saved float,
    assist_free_kick_won float,
    
    pen_area_entries float,
    pen_goals_conceded float,

    poss_won_att_3rd float,
    poss_won_def_3rd float,
    poss_won_mid_3rd float,


    penalty_conceded float,
    penalty_shootout_scored float,
    penalty_shootout_conceded_gk float,
    penalty_missed float,
    penalty_save float,
    penalty_shootout_saved_gk float,
    penalty_won float,
    penalty_shootout_missed_off_target float,
    penalty_faced float,
    penalty_shootout_saved float,

    att_post_high float,
    att_post_right float,
    att_post_left float,

    att_miss_right float,
    att_miss_high float,
    att_miss_high_left float,
    att_miss_left float,
    att_miss_high_right float,

    att_hd_miss float,
    att_hd_goal float,
    att_hd_total float,
    att_hd_target float,
    att_hd_post float,

    att_ibox_blocked float,
    att_ibox_goal float,
    att_ibox_target float,
    att_ibox_post float,
    att_ibox_miss float,

    att_obox_post float,
    att_obox_goal float,
    att_obox_target float,
    att_obox_blocked float,
    att_obox_miss float,
    
    att_obxd_right float,
    att_obxd_left float,

    att_sv_low_left float,
    att_sv_high_left float,
    att_sv_high_right float,
    att_sv_low_right float,
    att_sv_high_centre float,
    att_sv_low_centre float,

    att_obx_right float,
    att_obx_left float,
    att_obx_centre float,

    att_bx_right float,
    att_bx_left float,
    att_bx_centre float,

    att_lg_right float,
    att_lg_left float,
    att_lg_centre float,

    att_lf_goal float,
    att_lf_total float,
    att_lf_target float,

    att_rf_target float,
    att_rf_total float,
    att_rf_goal float,

    att_goal_high_left float,
    att_goal_low_right float,
    att_goal_low_left float,
    att_goal_low_centre float,
    att_goal_high_right float,
    att_goal_high_centre float,

    att_pen_target float,
    att_pen_goal float,
    att_pen_miss float,
    att_pen_post float,

    att_cmiss_high_left float,
    att_cmiss_right float,
    att_cmiss_high float,
    att_cmiss_left float,
    att_cmiss_high_right float,

    goal_scored_by_team_dmc float,
    goal_scored_by_team_fwl float,
    goal_scored_by_team_dr float,
    goal_scored_by_team_dc float,
    goal_scored_by_team_dl float,
    goal_scored_by_team_mr float,
    goal_scored_by_team_amr float,
    goal_scored_by_team_mc float,
    goal_scored_by_team_fw float,
    goal_scored_by_team_gk float,
    goal_scored_by_team_fwr float,
    goal_scored_by_team_amc float,
    goal_scored_by_team_sub float,
    goal_scored_by_team_aml float,
    goal_scored_by_team_ml float,
    goal_scored_by_team_dml float,
    goal_scored_by_team_dmr float,

    clean_sheet_gk float,
    clean_sheet_mc float,
    clean_sheet_fw float,
    clean_sheet_amr float,
    clean_sheet_dr float,
    clean_sheet_dl float,
    clean_sheet_dc float,
    clean_sheet_mr float,
    clean_sheet_fwl float,
    clean_sheet_amc float,
    clean_sheet_dmc float,
    clean_sheet_aml float,
    clean_sheet_ml float,
    clean_sheet_fwr float,
    clean_sheet_dmr float,
    clean_sheet_dml float,

    goals_conceded_ml float,
    goals_conceded_mc float,
    goals_conceded_fw float,
    goals_conceded_gk float,
    goals_conceded_ibox float,
    goals_conceded_dl float,
    goals_conceded_dr float,
    goals_conceded_dmc float,
    goals_conceded_dc float,
    goals_conceded_sub float,
    goals_conceded_amc float,
    goals_conceded_aml float,
    goals_conceded_amr float,
    goals_conceded_fwl float,
    goals_conceded_mr float,
    goals_conceded_fwr float,
    goals_conceded_dml float,
    goals_conceded_dmr float,

    goals_conceded_obox_gk float,
    goals_conceded_obox_mc float,
    goals_conceded_obox_ml float,
    goals_conceded_obox_amc float,
    goals_conceded_obox_aml float,
    goals_conceded_obox_dr float,
    goals_conceded_obox_dc float,
    goals_conceded_obox_amr float,
    goals_conceded_obox_fw float,
    goals_conceded_obox_fwl float,
    goals_conceded_obox_fwr float,
    goals_conceded_obox_mr float,
    goals_conceded_obox_sub float,
    goals_conceded_obox_dmc float,
    goals_conceded_obox_dl float,
    goals_conceded_obox_dmr float,
    goals_conceded_obox_dml float,

    primary key (player_id, match_id)
);