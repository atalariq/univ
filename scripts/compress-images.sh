#!/usr/bin/env bash
# Mengompres gambar yang belum optimal: PNG lewat oxipng, JPEG lewat magick.
# Pemakaian: mise run images [berkas...]
# Tanpa argumen, yang diperiksa hanya gambar di commit terakhir dan berkas
# gambar yang belum dilacak.
set -euo pipefail

targets=()
if [ $# -gt 0 ]; then
  targets=("$@")
else
  while IFS= read -r f; do targets+=("$f"); done < <(
    { git diff --name-only --diff-filter=AM HEAD -- '*.png' '*.jpg' '*.jpeg' 2>/dev/null
      git ls-files --others --exclude-standard -- '*.png' '*.jpg' '*.jpeg' 2>/dev/null
    } | sort -u
  )
fi

if [ ${#targets[@]} -eq 0 ]; then
  echo "tidak ada gambar untuk dikompres"
  exit 0
fi

before=0
after=0
for f in "${targets[@]}"; do
  [ -f "$f" ] || continue
  size_before=$(stat -c %s "$f")
  case "${f,,}" in
    *.png)
      oxipng -q --strip safe --opt max "$f" >/dev/null 2>&1 || true
      ;;
    *.jpg | *.jpeg)
      magick "$f" -strip -interlace Plane -quality 82 "$f" || true
      ;;
  esac
  size_after=$(stat -c %s "$f")
  before=$((before + size_before))
  after=$((after + size_after))
  printf '%-60s %6s -> %6s KB\n' "$(basename "$f")" "$((size_before / 1024))" "$((size_after / 1024))"
done

if [ "$before" -gt 0 ]; then
  printf '\ntotal %s KB -> %s KB\n' "$((before / 1024))" "$((after / 1024))"
fi
