# CV (LaTeX)

English CV of Masanari Kondo.

## Files

- `cv.tex` — CV source (edit this file)
- `photo.jpg` — photo shown on the first page
- `build.sh` — build script
- `cv.pdf` — generated PDF

## Requirements

A TeX distribution with `pdflatex` (e.g., [MacTeX](https://www.tug.org/mactex/) or TeX Live).
`latexmk` is used if available. No Japanese TeX engine is needed.

Packages used: `geometry`, `enumitem`, `titlesec`, `tabularx`, `xcolor`, `graphicx`, `hyperref`, `xurl`, `lmodern` (all included in MacTeX / TeX Live full).

## Build

Using the script:

```bash
./build.sh
```

Remove the generated files:

```bash
./build.sh clean
```

Or manually:

```bash
latexmk -pdf cv.tex
```

```bash
pdflatex cv.tex && pdflatex cv.tex
```

## Publishing on the homepage

`./build.sh` also copies the PDF to `../assets/cv/cv.pdf`, which is shown on the
homepage's CV page (`/cv/`, defined in `../z_cv.markdown`). `cv/cv.pdf` itself is
git-ignored, so after building, commit and push `assets/cv/cv.pdf` to update the site.

## Overleaf

On Overleaf, upload `cv.tex` and `photo.jpg` and compile with pdfLaTeX.

## Editing tips

- `\entry{dates}{content}` adds a dated row (appointments, grants, awards, etc.).
- `\me` prints your name in bold in author lists.
- `\inJP` adds "(in Japanese)".
- Publication lists number themselves ([J1], [C1], ...); add or remove `\item` lines freely.
- Lines marked `% CHECK` contain romanized names or translations to verify.
