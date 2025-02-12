# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from flask import request
from datetime import datetime as DateTime


class ValidationError(Exception):
  def __init__(self, parameter, message):
    self.parameter = parameter
    self.message = message
    super(ValidationError, self).__init__(message)

  def __str__(self):
    return f"{self.parameter} -> {self.message}"


def get_check_not_empty(param_name):
  param = request.args.get(param_name)
  if param is None or param == "":
    raise ValidationError(param_name, "must not be empty")
  return param


def format_datetime(datetime):
  datetime_format = "%Y-%m-%d %H:%M:%S"
  try:
    return DateTime.strptime(datetime, "%Y-%m-%d %H:%M:%S")
  except ValueError:
    raise ValidationError("datetime", f"must match {datetime_format}")


def format_domain_list(domain_list):
  if domain_list is None or domain_list == "":
    domain_list = []
  else:
    domain_list = domain_list.split(",")
  return domain_list


def format_physical(physical):
  if physical.lower() not in ("true", "false"):
    raise ValidationError("physical", "must be true or false")
  else:
    return physical.lower() == "true"


def validate_parse_grizzly_project_args():
  gcp_project = get_check_not_empty("project")
  datetime = format_datetime(get_check_not_empty("datetime"))
  return {
    "gcp_project": gcp_project,
    "object_query_function": "get_project_level_objects",
    "connection_query_function": "get_project_level_connections",
    "query_args": {
      "datetime": datetime,
    },
  }


def validate_parse_grizzly_domain_args():
  gcp_project = get_check_not_empty("project")
  datetime = format_datetime(get_check_not_empty("datetime"))
  domain = get_check_not_empty("domain")
  return {
    "gcp_project": gcp_project,
    "object_query_function": "get_domain_level_objects",
    "connection_query_function": "get_domain_level_connections",
    "query_args": {
      "datetime": datetime,
      "domain": domain
    },
  }


def validate_parse_grizzly_query_args():
  gcp_project = get_check_not_empty("project")
  datetime = format_datetime(get_check_not_empty("datetime"))
  domain = get_check_not_empty("domain")
  job_build_id = get_check_not_empty("job_build_id")
  return {
    "gcp_project": gcp_project,
    "object_query_function": "get_query_level_objects",
    "connection_query_function": "get_query_level_connections",
    "query_args": {
      "datetime": datetime,
      "domain": domain,
      "job_build_id": job_build_id,
    },
  }


def validate_parse_grizzly_on_demand_args():
  gcp_project = get_check_not_empty("project")
  datetime = DateTime.utcnow()
  domains = format_domain_list(request.args.get("domain"))
  physical = format_physical(get_check_not_empty("physical"))
  return {
    "gcp_project": gcp_project,
    "datetime": datetime,
    "domains": domains,
    "physical": physical
  }


def validate_parse_grizzly_test_args():
  test_name = get_check_not_empty("test_name")
  physical = format_physical(get_check_not_empty("physical"))
  return {
    "test_name": test_name,
    "physical": physical
  }
