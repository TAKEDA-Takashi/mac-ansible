#!/bin/bash

export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"

[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

. "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
