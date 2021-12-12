source ~/.fish_aliases
source ~/.local/.aliases
source ~/.local/.sets
source ~/.fish_variables

set -eg fish_user_paths

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

# elixir
set -gx PATH $HOME/.elixirls/release $PATH

# haskell ghcup
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/zeeshan/.ghcup/bin # ghcup-env
#[ -f "/Users/zeeshan/.ghcup/env" ] && source "/Users/zeeshan/.ghcup/env" # ghcup-env

# ocaml/opam
source /Users/zeeshan/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# asdf erlang/elixir
source (brew --prefix asdf)/asdf.fish

set -gx WASMTIME_HOME "$HOME/.wasmtime"

# rust
# set -gx PATH $HOME/.cargo/bin $PATH

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

dedup_path

# ulimit
ulimit -S -n 65536

# zoxide/z & fzf
fzf_key_bindings
zoxide init fish | source

# direnv
direnv hook fish | source
fish_add_path /usr/local/opt/llvm/bin

# Created by `pipx` on 2022-02-16 16:58:44
set PATH $PATH /Users/zeeshan/.local/bin
