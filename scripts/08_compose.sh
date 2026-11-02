#!/usr/bin/env bash
# 보너스: Compose up/ps/logs/컨테이너 간 통신/환경변수/down
source "$(dirname "$0")/lib.sh"
start_log 08_compose.txt
cd "$ROOT"


section "up / ps"
run 'docker compose up -d --build --quiet-pull 2>&1 | grep -v -E "^#|exporting|resolve|DONE|CACHED|transferring|naming|unpacking"'
run 'docker compose ps'

section "접속 + 컨테이너 간 통신 (서비스 이름 cache 로 DNS 조회)"
run 'sleep 3; curl -si http://localhost:8088 | grep -i -E "HTTP/|X-App-Env"'
run 'docker compose exec -T web nslookup cache'
run 'docker compose exec -T web sh -c "printf \"PING\r\n\" | nc -w 2 cache 6379"'

section "logs"
run 'docker compose logs --tail 5'

section "환경변수로 포트/모드 변경 (호스트 9090 → 컨테이너 8000, 모드 staging)"
run 'WEB_PORT=9090 NGINX_PORT=8000 APP_ENV=staging docker compose up -d'
run 'sleep 3; curl -si http://localhost:9090 | grep -i -E "HTTP/|X-App-Env"'
run 'docker compose ps'

section "down"
run 'docker compose down'
run 'docker compose ps -a'
