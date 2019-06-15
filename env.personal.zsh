# vi: ft=zsh

if [[ -x "$(command -v gpg-agent)" ]]; then
  export GPG_TTY=$(tty)
  export GPG_AGENT_INFO="~/.gnupg/S.gpg-agent:$(pgrep gpg-agent):1"
  eval $(keychain --eval --quiet --agents gpg,ssh id_rsa 7BC4A28A1AC176C3)
fi
