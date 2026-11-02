#!/usr/bin/env bash
# 터미널 기본 조작 로그: 위치/목록(숨김 포함)/이동/생성/복사/이동·이름변경/삭제/내용확인/빈파일
source "$(dirname "$0")/lib.sh"
start_log 01_terminal.txt
cd "$ROOT"

section "현재 위치 확인 (절대 경로)"
run 'pwd'
section "목록 확인 (숨김 파일 포함)"
run 'ls -la'
section "디렉토리 생성 (-p: 중간 경로까지 한 번에)"
run 'mkdir -p practice/docs practice/backup'
section "이동 (상대 경로 / 절대 경로)"
run 'cd practice && pwd'
run 'cd "$ROOT/practice/docs" && pwd'
run 'cd practice/docs && cd ../.. && pwd'
section "빈 파일 생성 / 내용 있는 파일 생성"
run 'touch practice/empty.txt'
run 'echo "hello codyssey" > practice/hello.txt'
run 'ls -la practice'
section "파일 내용 확인"
run 'cat practice/hello.txt'
run 'wc -c practice/empty.txt'
section "복사"
run 'cp practice/hello.txt practice/backup/hello.bak'
run 'cp -r practice/docs practice/docs_copy'
run 'ls -la practice practice/backup'
section "이동 / 이름 변경"
run 'mv practice/hello.txt practice/docs/greeting.txt'
run 'mv practice/docs_copy practice/docs_renamed'
run 'ls -la practice practice/docs'
section "삭제"
run 'rm practice/empty.txt'
run 'rm -r practice/docs_renamed'
run 'ls -la practice'
section "정리"
run 'rm -rf practice && echo "practice 삭제 완료"'
