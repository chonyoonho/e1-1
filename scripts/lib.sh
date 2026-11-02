#!/usr/bin/env bash
# 공통 헬퍼: "명령어 입력"과 "출력 결과"를 함께 로그 파일에 남긴다.
# 사용법: start_log xx.txt; run 'docker ps -a'
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p "$ROOT/logs"
# Git Bash(Windows)에서 /data 같은 컨테이너 경로가 C:/Program Files/Git/data 로 바뀌는 것을 막는다. (트러블슈팅 #2)
export MSYS_NO_PATHCONV=1

run() {
  { echo "\$ $1"; eval "$1" 2>&1; echo; } | tee -a "$LOG"
}

section() {
  { echo "# ===== $1 ====="; echo; } | tee -a "$LOG"
}

# 호스트 경로 (Windows Git Bash면 C:/... 형식, 그 외엔 그대로)
host_path() {
  if (cd "$1" && pwd -W) >/dev/null 2>&1; then (cd "$1" && pwd -W); else (cd "$1" && pwd); fi
}

start_log() {
  LOG="$ROOT/logs/$1"
  : > "$LOG"
  echo "# 수행 일시: $(date '+%Y-%m-%d %H:%M:%S %Z')" | tee -a "$LOG"
  echo | tee -a "$LOG"
}
