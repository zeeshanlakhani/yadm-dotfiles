source ~/.fish_aliases
source ~/.local/.aliases
source ~/.fish_variables

set -g theme_date_timezone America/New_York
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_k8s_context yes
set -g theme_display_virtualenv yes
set -g theme_display_vi no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_display_jobs_verbose yes
set -g theme_color_scheme solarized-dark

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# haskell ghcup
[ -f "/Users/zeeshanlakhani/.ghcup/env" ] && source "/Users/zeeshanlakhani/.ghcup/env" # ghcup-env

# ocaml/opam
source /Users/zeeshanlakhani/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# pyenv
status --is-interactive; and source (pyenv init -|psub)

# asdf erlang/elixir
source (brew --prefix asdf)/asdf.fish

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH