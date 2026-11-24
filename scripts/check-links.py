#!/usr/bin/env python3
"""Periksa tautan relatif di semua berkas markdown.

Dipakai lewat `mise run links`. Keluar dengan kode 1 kalau ada tautan yang
menunjuk ke berkas atau folder yang tidak ada.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

LINK = re.compile(r"\]\(([^)\s]+)\)")


def iter_markdown(root: Path):
    for path in root.rglob("*.md"):
        if ".git" in path.parts or ".worktrees" in path.parts or ".agents" in path.parts:
            continue
        if any(part.endswith(".local") for part in path.parts):
            continue
        yield path


def check(root: Path) -> int:
    missing = 0
    for md in sorted(iter_markdown(root)):
        try:
            text = md.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue
        for target in LINK.findall(text):
            if target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            clean = target.split("#", 1)[0]
            if not clean:
                continue
            resolved = (md.parent / clean).resolve()
            if not resolved.exists():
                print(f"{md.relative_to(root)}: {target}")
                missing += 1
    return missing


def main() -> int:
    root = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
    missing = check(root)
    if missing:
        print(f"\n{missing} tautan rusak")
        return 1
    print("semua tautan relatif hidup")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
