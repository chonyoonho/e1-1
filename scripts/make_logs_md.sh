#!/usr/bin/env bash
# logs/*.txt 를 코드블록으로 묶어 docs/LOGS.md 하나로 만든다. (README에서 링크)
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/docs/LOGS.md"
{
  echo "# 전체 수행 로그"
  echo
  echo "> \`scripts/run_all.sh\` 실행 결과를 자동으로 모은 문서입니다. 원본: [logs/](../logs)"
  echo
  for f in "$ROOT"/logs/*.txt; do
    name="$(basename "$f")"
    echo "## $name"
    echo
    echo '```bash'
    cat "$f"
    echo '```'
    echo
  done
} > "$OUT"
echo "생성: $OUT"
