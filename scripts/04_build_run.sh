#!/usr/bin/env bash
# 커스텀 이미지 빌드 + 포트 매핑 2회 접속
source "$(dirname "$0")/lib.sh"
start_log 04_build_run.txt
cd "$ROOT"
docker rm -f web-8080 web-8081 >/dev/null 2>&1

section "빌드"
run 'docker build -t codyssey-web:1.0 ./app'
run 'docker images codyssey-web'
run 'docker inspect --format "{{json .Config.Labels}}" codyssey-web:1.0'
run 'docker inspect --format "{{json .Config.Env}}" codyssey-web:1.0'

section "포트 매핑 실행 (호스트 8080/8081 → 컨테이너 80)"
run 'docker run -d -p 8080:80 --name web-8080 codyssey-web:1.0'
run 'docker run -d -p 8081:80 -e APP_ENV=prod --name web-8081 codyssey-web:1.0'
run 'sleep 12; docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"'

section "접속 확인"
run 'curl -si http://localhost:8080 | head -12'
run 'curl -si http://localhost:8081/health'
run 'docker logs web-8080 2>&1 | tail -5'
echo ">> 브라우저에서 http://localhost:8080 , http://localhost:8081 을 열고 주소창 포함 캡처 → docs/screenshots/" | tee -a "$LOG"
