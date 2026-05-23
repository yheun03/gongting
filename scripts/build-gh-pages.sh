#!/usr/bin/env bash
set -euo pipefail

BASE_PATH="/gongting"
OUT_DIR="_site"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

cd "$ROOT"
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

cp -r resources html intro.html component.html "$OUT_DIR/"

find "$OUT_DIR" \( -name '*.scss' -o -name '*.map' -o -name '.DS_Store' \) -delete

cat > "$OUT_DIR/index.html" <<'EOF'
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="refresh" content="0; url=./intro.html">
  <link rel="canonical" href="./intro.html">
  <title>공팅</title>
  <script>location.replace("./intro.html");</script>
</head>
<body>
  <p><a href="./intro.html">공팅으로 이동</a></p>
</body>
</html>
EOF

rewrite_paths() {
  local file="$1"
  sed -i.bak \
    -e "s|href=\"/|href=\"${BASE_PATH}/|g" \
    -e "s|src=\"/|src=\"${BASE_PATH}/|g" \
    -e "s|url(/resources|url(${BASE_PATH}/resources|g" \
    -e "s|url(\"/resources|url(\"${BASE_PATH}/resources|g" \
    -e "s|content=\"/|content=\"${BASE_PATH}/|g" \
    -e 's|"src": "\\/|"src": "'"${BASE_PATH}"'/resources/favicon/|g' \
    "$file"
  rm -f "${file}.bak"
}

while IFS= read -r -d '' file; do
  rewrite_paths "$file"
done < <(find "$OUT_DIR" -type f \( -name '*.html' -o -name '*.css' -o -name '*.json' \) -print0)

echo "Built GitHub Pages site in ${OUT_DIR} (base: ${BASE_PATH})"
