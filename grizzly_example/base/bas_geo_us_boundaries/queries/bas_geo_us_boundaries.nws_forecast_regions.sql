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
  t.state,
  t.cwa,
  t.time_zone,
  t.fe_area,
  t.zone,
  t.name,
  t.state_zone,
  t.lon,
  t.lat,
  t.shortname,
  t.shape_geometry
FROM `bigquery-public-data.geo_us_boundaries.nws_forecast_regions` AS t
