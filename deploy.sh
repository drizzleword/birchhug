#!/usr/bin/env sh

#  Copyright 2024 Birchfox project contributors
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

set -o errexit
set -o nounset

# Create ~/.local/bin directory if needed
( umask 077 && mkdir -p "${HOME}/.local/bin" )

# Install script
curl --fail --show-error --silent \
  "https://raw.githubusercontent.com/drizzleword/birchfox/main/bin/bfox" \
  --output "${HOME}/.local/bin/bfox"
  
chmod 750 "${HOME}/.local/bin/bfox"

# Set completions dir path
completions_dir="${BASH_COMPLETION_USER_DIR:-"${XDG_DATA_HOME:-"$HOME/.local/share"}/bash-completion"}/completions"

# Create completions dir if needed
( umask 077 && mkdir -p "${completions_dir}" )

# Install completions file
curl --fail --show-error --silent \
  "https://raw.githubusercontent.com/drizzleword/birchfox/main/completions/bash/bfox" \
  --output "${completions_dir}/bfox"
