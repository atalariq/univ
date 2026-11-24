#!/usr/bin/env bash
# Membuat folder pertemuan baru beserta NOTES.md.
# Pemakaian: mise run new-session <folder-matkul> <nomor> <topik>
set -euo pipefail

if [ $# -lt 3 ]; then
  echo "pemakaian: new-session <folder-matkul> <nomor> <topik>" >&2
  echo "contoh:    new-session semester-3/ppwl-... 13 deployment" >&2
  exit 1
fi

course="$1"
number="$2"
topic="$3"

if [ ! -d "$course" ]; then
  echo "folder mata kuliah tidak ada: $course" >&2
  exit 1
fi

slug=$(printf '%s' "$topic" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-')
dir=$(printf '%s/p%02d-%s' "$course" "$number" "$slug")

if [ -e "$dir" ]; then
  echo "sudah ada: $dir" >&2
  exit 1
fi

mkdir -p "$dir"
printf '# Pertemuan %s: %s\n\n> Catatan belum ditulis.\n' "$number" "$topic" > "$dir/NOTES.md"
echo "dibuat: $dir"
