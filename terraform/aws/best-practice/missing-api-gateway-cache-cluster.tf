# Copyright 2019 Bridgecrew
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ok: missing-api-gateway-cache-cluster
resource "aws_api_gateway_stage" "pass" {
  name                  = "example"
  cache_cluster_enabled = true
}

# ruleid: missing-api-gateway-cache-cluster
resource "aws_api_gateway_stage" "fail" {
  name = "example"
}
