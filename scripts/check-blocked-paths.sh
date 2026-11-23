#!/usr/bin/env bash
# Menolak berkas yang tidak boleh masuk repo publik: dokumen pihak ketiga,
# arsip, dan video. Dijalankan pre-commit dengan daftar berkas ter-stase.
set -euo pipefail

bad=0
for f in "$@"; do
  case "${f,,}" in
    *.pdf | *.doc | *.docx | *.ppt | *.pptx | *.zip | *.apk | *.mp4 | *.mov | *.mkv)
      echo "ditolak: $f (ekstensi tidak diizinkan di repo publik)" >&2
      bad=1
      ;;
  esac
done
exit $bad
