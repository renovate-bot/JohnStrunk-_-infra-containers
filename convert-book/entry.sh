#! /bin/bash

# Usage: docker run --rm -i -v.:/data convert-book /data/input.epub /data/output.pdf

ebook-convert "$@" \
  --pdf-standard-font=sans \
  --pdf-sans-family="DejaVu Sans" \
  --pdf-serif-family="DejaVu Serif" \
  --pdf-mono-family="DejaVu Sans Mono" \
  --embed-font-family="DejaVu Sans" \
  --paper-size=letter \
  --preserve-cover-aspect-ratio \
  --change-justification="justify" \
  --pdf-page-numbers \
  --embed-all-fonts \
  --subset-embedded-fonts \
  --smarten-punctuation \
  --enable-heuristics
