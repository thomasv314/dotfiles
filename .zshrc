# uncomment below and the last line to enable zsh profiling
# zmodload zsh/zprof
source $HOME/dotfiles/func.zsh

export EDITOR=vim
export KEYTIMEOUT=1 # zsh vimode timeout
export GOPATH="$HOME/go"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PYENV_ROOT="$HOME/.pyenv"
export RBENV_ROOT="$HOME/.rbenv"

# zsh vi backspaces like a regular human
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
autoload -U +X bashcompinit; bashcompinit

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs kubecontext aws dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status root_indicator background_jobs history time virtualenv)
include "$HOME/dotfiles/etc/powerlevel9k/powerlevel9k.zsh-theme"

add_to_path "$HOME/go/bin"
add_to_path "$HOME/.krew/bin"

prepend_to_path "$HOME/.rbenv/shims"
prepend_to_path "$HOME/.pyenv/bin"
prepend_to_path "$HOME/Library/Python/2.7/bin"
prepend_to_path "$HOME/Library/Python/3.7/bin"

include $HOME/.zsh/antigen.zsh
include "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
include "/usr/local/opt/chtf/share/chtf/chtf.sh" # change terraform
include "$HOME/.acme.sh/acme.sh.env"
include "$HOME/.gren"

# direnv
if [[ -x "$(command -v direnv)" ]]; then eval "$(direnv hook zsh)"; fi

# Source environment specific stuffs
if [[ -f $HOME/.thomas ]]; then
  current_env=$(cat $HOME/.thomas)
  current_env_sh="$HOME/dotfiles/env.$current_env.zsh"
  include "$current_env_sh"
fi

export HISTSIZE=2000000
export HISTFILE="$HOME/.history"
export SAVEHIST=1000000
setopt inc_append_history
setopt share_history

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm

# Aliases
alias k="kubectl"
alias kns="kubens"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias gs="git status"
alias gc="git checkout"
alias gp="git pull"
alias tf="terraform"

function tfm() {
  cd "$HOME/proj/terraform-module-$1"
}

function tfgrep() {
  grep --exclude-dir=".terraform" $@
}

function clear_dns() {
 sudo killall -HUP mDNSResponder
}

function cert_from_endpoint() {
ex +'/BEGIN CERTIFICATE/,/END CERTIFICATE/p' <(echo | openssl s_client -showcerts -connect $1:443) -scq > $1.crt
}

function gp() {
  branch="$(git branch | sed -n '/\* /s///p')"
  url="https://github.com/syapse/synacl-base/pull/new/${branch}"
}

# Completion
source <(kubectl completion zsh)
compdef k='kubectl'

# uncomment below to profile
# zprof
#
export TF_VAR_ssh_key_name="i-dont-have-an-ssh-key"

eval "$(rbenv init -)"
