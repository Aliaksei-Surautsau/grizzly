/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "gcp_project_id" {
  type = string
  description = "Target Grizzly GCP Project Id. Define Project Id got dev, uat or prod environments."
}

variable "composer_environment_name" {
  type    = string
  description = "Name of the GCP Composer/Airflow environment."
}

variable "composer_location" {
  type    = string
  description = "Compute Engine region where the Composer environment's GKE cluster is located."
}
