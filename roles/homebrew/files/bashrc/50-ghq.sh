#!/bin/bash

function g() {
  sel=$(ghq list | peco)
  if [[ -n "$sel" ]]; then
    cd "$(ghq root)/${sel}"
  fi
}

function gb() {
  sel=$(ghq list | peco | cut -d "/" -f 2,3)
  if [[ -n "$sel" ]]; then
    hub browse "$sel"
  fi
}

function gc() {
  sel=$(ghq list | peco)
  if [[ -n "$sel" ]]; then
    code "$(ghq root)/${sel}"
  fi
}
