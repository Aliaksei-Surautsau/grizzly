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
  t.layer_code,
  t.layer_class,
  t.layer_name,
  t.gdal_type,
  t.osm_id,
  t.osm_way_id,
  t.osm_timestamp,
  t.osm_version,
  t.all_tags,
  t.geometry
FROM `bigquery-public-data.geo_openstreetmap.planet_layers` AS t
