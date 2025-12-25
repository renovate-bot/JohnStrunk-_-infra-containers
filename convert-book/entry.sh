#! /bin/bash

# Usage: docker run --rm -i convert-book < input.epub > output.pdf

ebook-convert /dev/stdin /dev/stdout \
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
