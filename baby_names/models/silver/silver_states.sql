SELECT
    ST_ABBREV.state_abbreviation
    , ST_ABBREV.state_name
    , ST_DEMOS.total_state_population
    , ST_DEMOS.total_hispaniclatino
    , ST_DEMOS.total_non_hispaniclatino
    , ST_EDU.percent_pop_25over_lessthan9thgrade
    , ST_EDU.percent_pop_25over_9thto12th_nodiploma
    , ST_EDU.percent_pop_25over_highschoolgrad
    , ST_EDU.percent_pop_25over_somecollegenodegree
    , ST_EDU.percent_pop_25over_associatesdegree
    , ST_EDU.percent_pop_25over_bachelorsdegree
    , ST_EDU.percent_pop_25over_graduateorprofessionaldegree
    , ST_EDU.percent_pop_25over_highschoolgradorhigher
    , ST_GEO.area_land_in_square_miles
    , ST_GEO.area_water_in_square_miles
    , CASE 
        WHEN CAST(ST_GEO.area_land_in_square_miles AS INTEGER) > 0
            THEN CAST(ST_DEMOS.total_state_population AS FLOAT) / CAST(ST_GEO.area_land_in_square_miles AS FLOAT)
        ELSE NULL
    END AS population_per_square_mile
FROM {{ref('bronze_state_abbreviation')}} AS ST_ABBREV
INNER JOIN {{ref('bronze_state_demographics')}} AS ST_DEMOS
    ON ST_DEMOS.state_name = ST_ABBREV.state_name
INNER JOIN {{ref('bronze_state_educational_attainment')}} AS ST_EDU
    ON ST_EDU.state_id = ST_DEMOS.state_id
INNER JOIN {{ref('bronze_state_geography')}} AS ST_GEO
    on ST_GEO.state_id = ST_EDU.state_id