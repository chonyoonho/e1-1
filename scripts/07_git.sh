#!/usr/bin/env bash
# Git 설정 확인. 이메일·토큰은 마스킹해서 기록한다.
source "$(dirname "$0")/lib.sh"
start_log 07_git.txt
cd "$ROOT"

mask() {
  sed -E 's/([A-Za-z0-9._%+-]{2})[A-Za-z0-9._%+-]*@([A-Za-z0-9.-]+)/\1***@\2/g; s#//[^@/]+@#//***@#g' \
    | grep -v -i -E 'token|password'
}

run 'git --version'
run 'git config --list | mask'
run 'git config --global init.defaultBranch'
run 'git branch --show-current'
run 'git remote -v | mask'
run 'git log --oneline -5'
