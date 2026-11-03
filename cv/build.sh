#!/usr/bin/env bash
# Build cv.pdf from cv.tex.
# Usage: ./build.sh          build cv.pdf and remove auxiliary files
#        ./build.sh clean    remove auxiliary files and cv.pdf
set -euo pipefail

cd "$(dirname "$0")"

if [[ "${1:-}" == "clean" ]]; then
  rm -f cv.aux cv.log cv.out cv.fls cv.fdb_latexmk cv.pdf
  exit 0
fi

if command -v latexmk >/dev/null 2>&1; then
  latexmk -pdf -interaction=nonstopmode -halt-on-error cv.tex
  latexmk -c cv.tex
elif command -v pdflatex >/dev/null 2>&1; then
  # Run twice so that cross-references and hyperlinks are resolved
  pdflatex -interaction=nonstopmode -halt-on-error cv.tex
  pdflatex -interaction=nonstopmode -halt-on-error cv.tex
  rm -f cv.aux cv.log cv.out
else
  echo "Error: neither latexmk nor pdflatex was found. Install a TeX distribution (e.g., MacTeX)." >&2
  exit 1
fi

echo "Built: $(pwd)/cv.pdf"
