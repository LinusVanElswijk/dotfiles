#!/usr/bin/env bash

CONFIG="$HOME/.config/git/profiles.json"

list_profiles() {
  jq -r 'keys[]' "$CONFIG"
}

select_profile() {
  local p="$1"

  if ! jq -e --arg p "$p" '.[$p]' "$CONFIG" >/dev/null; then
    echo "Unknown profile: $p"
    echo "Available:"
    list_profiles
    exit 1
  fi

  local name email key
  name=$(jq -r --arg p "$p" '.[$p].name' "$CONFIG")
  email=$(jq -r --arg p "$p" '.[$p].email' "$CONFIG")
  key=$(jq -r --arg p "$p" '.[$p].signingkey // empty' "$CONFIG")

  git config user.name "$name"
  git config user.email "$email"

  if [[ -n "$key" ]]; then
    git config user.signingkey "$key"
  fi
}

case "$1" in
list) list_profiles ;;
select) select_profile "$2" ;;
*) echo "usage: git profile {list|select <name>}" ;;
esac
