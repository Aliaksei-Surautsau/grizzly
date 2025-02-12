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
  description = "The ID of the GCP project."
}

variable "repository_name" {
  type = string
  description = "Grizzly repository name."
  default = "grizzly"
}

variable "framework_repository" {
  type = string
  description = "Grizzly framework repository name."
  default = "grizzly_framework"
}

variable "gcp_resource_location" {
  type = string
  description = "Default location of GCP resources."
}