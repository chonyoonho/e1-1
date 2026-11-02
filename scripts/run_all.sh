#!/usr/bin/env bash
# 전체 실습을 순서대로 수행하고 logs/ 에 기록한다. (Docker 엔진 실행 상태에서)
cd "$(dirname "$0")"
for s in 01_terminal 02_permissions 03_docker_basics 04_build_run 05_bind_mount 06_volume 08_compose 07_git; do
  echo "==================== $s ===================="
  bash "./$s.sh"
done
