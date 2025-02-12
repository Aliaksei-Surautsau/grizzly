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

variable "gcp_project_number" {
  type = string
  description = "The numeric identifier of the project."
}

variable "composer_environment_name" {
  type    = string
  description = "Name of the GCP Composer/Airflow environment."
}

variable "composer_image_version" {
  type    = string
  description = "Cloud Composer image with the required version of Airflow."
}

variable "composer_location" {
  type    = string
  description = "Compute Engine region where the Composer environment's GKE cluster is located."
}

#### Default parameters

variable "default_datacatalog_taxonomy_location" {
  type    = string
  description = "Default location for search of DataCatalog Taxonomies. (us, europe, us-central1, etc.)"
}

variable "composer_oauth_scopes" {
  type    = list(string)
  description = "The set of Google API scopes to be made available on all node VMs."
  default = [
    "https://www.googleapis.com/auth/spreadsheets",
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/drive"
  ]
}

variable "gcp_resource_location" {
  type = string
  description = "Default location of GCP resources."
}

locals {
  airflow_variables = {
    ENVIRONMENT: "N/A",
    ETL_LOG_TABLE: "etl_log.composer_job_details",
    ETL_STAGE_DATASET: "etl_staging_composer",
    FORCE_OFF_HX_LOADING: "N",
    GCP_PROJECT_ID: var.gcp_project_id,
    HISTORY_TABLE_CONFIG: "{\n  \"dataset_id\": \"{{ target_dataset_id }}_hx\",\n  \"default_history_expiration\": 180,\n  \"table_id\": \"{{ target_table_id }}_hx\"\n}",
    DEFAULT_DATACATALOG_TAXONOMY_LOCATION: "projects/${var.gcp_project_id}/locations/${var.default_datacatalog_taxonomy_location}/taxonomies",
    GCP_RESOURCE_LOCATION: var.gcp_resource_location
  }
  airflow_config_overrides = {
    core-load_example = "True",
    celery-worker_concurrency=12,
    core-non_pooled_task_slot_count=300,
    core-dag_concurrency =300,
    core-dagbag_import_timeout=120,
    core-parallelism=300,
    scheduler-max_threads=4,
    webserver-instance_name="${var.composer_environment_name} : ${var.gcp_project_id}"
  }
  pool = {
    name: "default_pool",
    value: 128,
    description: "Default pool"
  }
}
