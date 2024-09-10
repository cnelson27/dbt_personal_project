SELECT
    geo_id AS state_id
    , _name AS state_name
    , arealand_sqmi AS area_land_in_square_miles
    , areawatr_sqmi AS area_water_in_square_miles
FROM state_geography
WHERE
    geo_id <> 'Geographic Identifier'