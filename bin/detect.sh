#!/usr/bin/env bash
##
# Copyright IBM Corporation 2016
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##
# bin/detect <build-dir>

# Abort if any command fails
set -e

# Configure directories
BP_DIR=$(cd $(dirname $0); cd ..; pwd)
APP_DIR=$1

# Load convenience functions
source $BP_DIR/lib/common.sh

if [[ -f $APP_DIR/Package.swift ]]; then
  swift_version="$(get_swift_version)"
  buildpack_version="$(cat $BP_DIR/VERSION)"
  echo "IBM Bluemix buildpack for Swift (Swift: $swift_version, buildpack: $buildpack_version)" && exit 0
else
  echo "no" && exit 1
fi
