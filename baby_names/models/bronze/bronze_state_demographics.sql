SELECT
    geo_id AS state_id
    , _name AS state_name
    , p9_001n AS total_state_population
    , p9_002n AS total_hispaniclatino
    , p9_003n AS total_non_hispaniclatino
FROM
    state_demographics
WHERE
    geo_id <> 'Geography'