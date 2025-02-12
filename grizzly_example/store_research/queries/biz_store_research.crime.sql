-- Copyright 2022 Google LLC
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

SELECT
    cr.unique_key,
    cr.case_number,
    cr.date,
    cr.block,
    cr.iucr,
    cr.primary_type,
    cr.description,
    cr.location_description,
    cr.arrest,
    cr.domestic,
    cr.beat,
    cr.district,
    cr.ward,
    cr.community_area,
    cr.fbi_code,
    cr.x_coordinate,
    cr.y_coordinate,
    cr.year,
    cr.updated_on,
    cr.latitude,
    cr.longitude,
    cr.location,
    ST_GEOGPOINT(cr.longitude, cr.latitude) AS geo_point,
    zc.zip_code,
    zc.zip_code_geom
FROM
    `bas_chicago_crime.crime` AS cr
INNER JOIN
    `biz_store_research.chicago_zip_codes` AS zc
ON ST_CONTAINS(zc.zip_code_geom, ST_GEOGPOINT(cr.longitude, cr.latitude))
WHERE
    cr.year > 2012
