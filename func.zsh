function include () {
    [[ -f "$1" ]] && source "$1"
}

function prepend_to_path() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
      PATH="$1:${PATH:+"$PATH:"}"
  fi
}

function add_to_path() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
      PATH="${PATH:+"$PATH:"}$1"
  fi
}
