#!/usr/bin/env bash
# 권한 실습: Windows NTFS(Git Bash)는 chmod가 반영되지 않으므로(트러블슈팅 #1)
# 리눅스 파일시스템을 가진 ubuntu 컨테이너 안에서 수행한다. (실제 명령: perm_inner.sh)
source "$(dirname "$0")/lib.sh"
start_log 02_permissions.txt

section "(참고) 호스트 Git Bash 에서 chmod 시도 → 변화 없음"
run 'cd "$(mktemp -d)" && touch f && ls -l f && chmod 600 f && ls -l f'
run 'mount | grep " on / "'

section "ubuntu 컨테이너 안에서 권한 실습 (+ 는 컨테이너 안에서 실행된 명령)"
run 'docker run --rm -i ubuntu:24.04 bash < "$ROOT/scripts/perm_inner.sh"'
