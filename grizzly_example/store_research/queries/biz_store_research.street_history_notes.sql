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
  h.id,
  h.version,
  h.username,
  h.changeset,
  h.visible,
  h.osm_timestamp,
  h.geometry,
  h.all_tags,
  h.latitude,
  h.longitude,
  zc.zip_code,
  zc.zip_code_geom
FROM `bas_geo_openstreetmap.history_nodes` AS h
INNER JOIN `biz_store_research.chicago_zip_codes` AS zc
ON ST_CONTAINS(zc.zip_code_geom , h.geometry)
WHERE EXTRACT(YEAR FROM h.osm_timestamp) <= 2018
