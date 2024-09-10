SELECT 
    BIRTH_NAMES.state_abbreviation
    , ST_ABBREV.state_name
    , BIRTH_NAMES.year
    , BIRTH_NAMES.name
    , BIRTH_NAMES.sex
    , BIRTH_NAMES.birth_count
    , CASE
        WHEN CAST(TOT_BIRTHS.births AS INTEGER) > 0
            THEN CAST(BIRTH_NAMES.birth_count AS FLOAT) / CAST(TOT_BIRTHS.births AS FLOAT)
        ELSE 0
    END AS percent_of_total_births
FROM {{ref('bronze_birth_names')}} AS BIRTH_NAMES
INNER JOIN {{ref('bronze_state_abbreviation')}} AS ST_ABBREV
    ON BIRTH_NAMES.state_abbreviation = ST_ABBREV.state_abbreviation
INNER JOIN {{ref('bronze_state_births')}} AS TOT_BIRTHS
    ON TOT_BIRTHS.state_name = ST_ABBREV.state_name
    AND TOT_BIRTHS.year = BIRTH_NAMES.year
    AND TOT_BIRTHS.sex = BIRTH_NAMES.sex