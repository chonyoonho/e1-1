#!/usr/bin/env bash
# Docker 볼륨 영속성: 컨테이너 삭제 후에도 데이터 유지
source "$(dirname "$0")/lib.sh"
start_log 06_volume.txt
docker rm -f vol-test vol-test2 novol >/dev/null 2>&1
docker volume rm codyssey-data >/dev/null 2>&1

section "볼륨 생성 / 확인"
run 'docker volume create codyssey-data'
run 'docker volume ls'
run 'docker volume inspect codyssey-data'

section "컨테이너 1(vol-test)에 연결 후 데이터 기록"
run 'docker run -d --name vol-test -v codyssey-data:/data ubuntu:24.04 sleep infinity'
run 'docker exec vol-test bash -c "echo persisted-at-\$(date +%H%M%S) > /data/hello.txt && cat /data/hello.txt"'

section "컨테이너 1 삭제"
run 'docker rm -f vol-test'
run 'docker ps -a --filter name=vol-test'

section "새 컨테이너 2(vol-test2)에 같은 볼륨 연결 → 데이터 유지 확인"
run 'docker run -d --name vol-test2 -v codyssey-data:/data ubuntu:24.04 sleep infinity'
run 'docker exec vol-test2 cat /data/hello.txt'

section "비교: 볼륨 없이 컨테이너 레이어에 쓴 데이터는 새 컨테이너에서 보이지 않음"
run 'docker run --name novol ubuntu:24.04 bash -c "echo temp > /tmp/x.txt && cat /tmp/x.txt"'
run 'docker rm novol'
run 'docker run --rm ubuntu:24.04 cat /tmp/x.txt'

section "정리"
run 'docker rm -f vol-test2'
