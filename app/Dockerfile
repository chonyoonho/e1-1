# (A) 웹 서버 베이스 이미지 활용 방식
FROM nginx:1.27-alpine

# [커스텀 1] 이미지 메타데이터: 누가/무엇을 위해 만든 이미지인지 식별
LABEL org.opencontainers.image.title="codyssey-web" \
      org.opencontainers.image.description="Codyssey pre-course custom nginx image"

# [커스텀 2] 환경변수: 설정과 코드 분리 (실행 시 -e 로 덮어쓰기 가능)
ENV APP_ENV=dev \
    NGINX_PORT=80

# [커스텀 3] 서버 설정 교체: 템플릿으로 포트/헤더를 환경변수화
COPY nginx/templates/ /etc/nginx/templates/

# [커스텀 4] 정적 콘텐츠 교체
COPY site/ /usr/share/nginx/html/

EXPOSE 80

# [커스텀 5] 헬스체크: 컨테이너가 "실행 중"인지가 아니라 "응답 가능"한지 확인
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- "http://127.0.0.1:${NGINX_PORT}/health" || exit 1
