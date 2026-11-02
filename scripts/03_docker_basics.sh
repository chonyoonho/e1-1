#!/usr/bin/env bash
# Docker 설치 점검 + 기본 운영 명령 + hello-world / ubuntu 실습
source "$(dirname "$0")/lib.sh"
start_log 03_docker_basics.txt
docker rm -f hello ubu ubu-attach ticker >/dev/null 2>&1

section "설치/데몬 점검"
run 'docker --version'
run 'docker info'

section "이미지 다운로드 / 목록"
run 'docker pull hello-world'
run 'docker pull ubuntu:24.04'
run 'docker images'

section "hello-world 실행"
run 'docker run --name hello hello-world'

section "ubuntu 컨테이너: 실행 → 내부 명령 (실행 후 자동 삭제 --rm)"
run 'docker run --rm ubuntu:24.04 bash -c "ls / && echo hello-from-ubuntu && head -2 /etc/os-release"'

section "exec vs attach 차이 관찰"
run 'docker run -dit --name ubu ubuntu:24.04 bash'
# exec: PID 1(bash)과 별개의 새 프로세스를 띄움 → 그 프로세스가 끝나도 컨테이너는 유지
run 'docker exec ubu bash -c "echo exec 로 새 프로세스 실행; ps -ef"'
run 'docker ps --filter name=ubu --format "{{.Names}} {{.Status}}"'
# attach: PID 1 의 표준입출력에 직접 연결 → 그 셸에서 exit 하면 PID 1 종료 = 컨테이너 종료
# -t(TTY) 로 만든 컨테이너는 파이프 입력으로 attach 할 수 없음 (트러블슈팅 #3) → -i 만 준 컨테이너로 관찰
run 'echo exit | docker attach ubu'
run 'docker run -di --name ubu-attach ubuntu:24.04 bash'
run 'docker ps --filter name=ubu-attach --format "{{.Names}} {{.Status}}"'
run 'echo exit | docker attach ubu-attach; sleep 1; docker ps -a --filter name=ubu --format "{{.Names}} {{.Status}}"'

section "컨테이너 실행 / 목록 / 로그 / 리소스 / 중지"
run 'docker run -d --name ticker ubuntu:24.04 bash -c "for i in \$(seq 1 1000); do echo tick \$i; sleep 1; done"'
run 'sleep 3; docker ps'
run 'docker logs --tail 5 ticker'
run 'docker stats --no-stream'
run 'docker stop ticker'
run 'docker ps -a'

section "정리"
run 'docker rm -f hello ubu ubu-attach ticker'
