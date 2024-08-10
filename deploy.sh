#!/usr/bin/env sh

#  Copyright 2024 Birchhug project contributors
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
( umask 077 && mkdir -p "${HOME}/.local/bin" ) || { echo "Unable to make bin directory" >&2; exit 1; }

# Install script
curl --fail --show-error --silent \
  "https://raw.githubusercontent.com/drizzleword/birchhug/main/bin/bhug" \
  --output "${HOME}/.local/bin/bhug" || { echo "Unable to download executable file" >&2; exit 1; }
  
chmod 750 "${HOME}/.local/bin/bhug" || { echo "Unable to chmod executable file" >&2; exit 1; }

# Set completions dir path
completions_dir="${BASH_COMPLETION_USER_DIR:-"${XDG_DATA_HOME:-"$HOME/.local/share"}/bash-completion"}/completions" || { echo "Unable to set completions directory path" >&2; exit 1; }

# Create completions dir if needed
( umask 077 && mkdir -p "${completions_dir}" ) || { echo "Unable to make completions directory" >&2; exit 1; }

# Install completions file
curl --fail --show-error --silent \
  "https://raw.githubusercontent.com/drizzleword/birchhug/main/completions/bash/bhug" \
  --output "${completions_dir}/bhug" || { echo "Unable to download completions file" >&2; exit 1; }
