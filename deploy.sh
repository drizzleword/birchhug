#!/usr/bin/env sh

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
