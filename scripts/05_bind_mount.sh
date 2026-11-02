#!/usr/bin/env bash
# 바인드 마운트: 호스트 파일 수정 → 재빌드 없이 컨테이너 응답이 바뀌는지 확인
source "$(dirname "$0")/lib.sh"
start_log 05_bind_mount.txt
cd "$ROOT"
docker rm -f web-bind >/dev/null 2>&1
rm -rf mount-site && cp -r app/site mount-site
SITE="$(host_path mount-site)"

section "바인드 마운트로 실행 (호스트 mount-site/ → 컨테이너 /usr/share/nginx/html)"
run "docker run -d -p 8082:80 --name web-bind -v \"$SITE:/usr/share/nginx/html\" codyssey-web:1.0"
run 'sleep 2; curl -s http://localhost:8082 | grep "site version"'

section "호스트에서 파일 수정 (변경 전 v1 → 후 v2)"
run 'sed -i "s/site version: v1/site version: v2 (bind mount 즉시 반영)/" mount-site/index.html'
run 'curl -s http://localhost:8082 | grep "site version"'
run 'docker exec web-bind grep "site version" /usr/share/nginx/html/index.html'

section "비교: 마운트 없는 컨테이너(web-8080, 이미지에 구운 파일)는 그대로 v1"
run 'curl -s http://localhost:8080 | grep "site version" || echo "web-8080 미실행"'
