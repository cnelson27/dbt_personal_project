SELECT
    geo_id as state_id
    , _name AS state_name
    , s1501_c02_007e AS percent_pop_25over_lessthan9thgrade
    , s1501_c02_008e AS percent_pop_25over_9thto12th_nodiploma
    , s1501_c02_009e AS percent_pop_25over_highschoolgrad
    , s1501_c02_010e AS percent_pop_25over_somecollegenodegree
    , s1501_c02_011e AS percent_pop_25over_associatesdegree
    , s1501_c02_012e AS percent_pop_25over_bachelorsdegree
    , s1501_c02_013e AS percent_pop_25over_graduateorprofessionaldegree
    , s1501_c02_014e AS percent_pop_25over_highschoolgradorhigher
FROM
    state_educational_attainment
WHERE
    geo_id <> 'Geography'