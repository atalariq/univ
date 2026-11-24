#!/usr/bin/env bash
# Menampilkan daftar pertemuan per mata kuliah, untuk menyusun README.
# Pemakaian: mise run sessions [pola]
set -euo pipefail

pattern="${1:-semester-*}"

for course in $pattern/*/; do
  [ -d "$course" ] || continue
  count=$(find "$course" -maxdepth 1 -type d -name 'p[0-9][0-9]-*' | wc -l)
  [ "$count" -eq 0 ] && continue
  printf '%s (%s)\n' "${course%/}" "$count"
  for dir in "$course"p[0-9][0-9]-*/; do
    [ -d "$dir" ] || continue
    name=$(basename "$dir")
    if [ -f "$dir/NOTES.md" ]; then
      if grep -q "Catatan belum ditulis" "$dir/NOTES.md" 2>/dev/null; then
        status="stub"
      else
        status="catatan"
      fi
    elif [ -f "$dir/LOG.md" ]; then
      status="log"
    else
      status="kosong"
    fi
    printf '  %-45s %s\n' "$name" "$status"
  done
  echo
done
