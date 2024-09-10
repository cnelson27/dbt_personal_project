SELECT 
    BIRTH_NAMES.name
    , CASE
        WHEN OT_NAMES.name IS NOT NULL 
            THEN TRUE
        ELSE FALSE
    END AS old_testament_name_flag
FROM {{ref('bronze_birth_names')}} AS BIRTH_NAMES
LEFT JOIN {{ref('bronze_old_testament_names')}} AS OT_NAMES
    ON BIRTH_NAMES.name = OT_NAMES.name