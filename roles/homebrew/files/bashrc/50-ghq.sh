#!/bin/bash

alias g='cd $(ghq root)/$(ghq list | peco)'
alias gb='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
