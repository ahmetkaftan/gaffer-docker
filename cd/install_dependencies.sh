#!/bin/bash

# Copyright 2020 Crown Copyright
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

# Resolve dependencies of these charts in order
charts_to_resolve="gaffer gaffer-road-traffic gaffer-jhub"

project_root="$( cd $(dirname $(dirname $0)) > /dev/null 2>&1 && pwd )"
cd ${project_root}/kubernetes
for chart in ${charts_to_resolve}; do	
    helm dependency update ${chart}	
done
