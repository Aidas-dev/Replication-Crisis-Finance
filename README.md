# Replication Crisis in Finance: review of Jensen, Kelly, and Pedersen (2023)

This repository holds two Typst documents about "Is There a Replication Crisis in Finance?" by Theis Ingerslev Jensen, Bryan Kelly, and Lasse Heje Pedersen, Journal of Finance 78(5), 2023, pages 2465 to 2518, DOI 10.1111/jofi.13249.

`report.typ` is the written review. It is the group assignment for Empirical Finance, set as an A4 preprint, 10 pages.

`slides.typ` is the presentation. It is the individual assignment for Applied Microeconomics, 16 by 9, 15 slides, dated 2026-11-11. The deck follows the Vilnius University wildcat theme: burgundy facets on the title and closing slides, white content slides, burgundy titles with a gold rule, and the VU mark in white.

## Build

The build needs Typst 0.15.1. Make sure that `typst --version` reports 0.15.1 or a newer release.

    typst compile report.typ
    typst compile slides.typ

Each command writes a PDF next to its source: `report.pdf` and `slides.pdf`. The report downloads `@preview/elsearticle:3.1.0` on its first build, so make sure that the machine can reach the Typst package registry. The deck uses no packages.

Commit both PDFs after a change, so the published copies match the sources.

## Theme

The palette comes from `wildcat/beamercolorthemewildcat.sty`: burgundy `#7D2035`, its tints, and the gold accent `#FFD100`. The facet background is `assets/facets.svg`, and the white VU mark is `assets/vu-logo-white.png`. The deck uses the TeX Gyre Heros and Adventor fonts, which ship with TeX Live and are embedded in the PDF.

`wildcat/` holds the LaTeX template that the theme follows. It is reference material, and Git ignores it.

## Source material

`paper_jf_2023_replication_crisis.md` is the text of the article. `NOTES_paper.md` is a page-by-page reading note, and it lists most of the numbers that both documents use.

`jf_clean.txt` and `jf_layout.txt` are local text extracts from the PDF. The clean file joins broken words. The layout file keeps the columns of the tables, and it is the file to read when a number comes from a table. Both are ignored by Git.

## Numbers

Every figure in the review comes from the published article. Table I of the article is the source for `tab:hyper`. The reconstruction in `tab:harvey` comes from the discussion slides of Campbell Harvey, which are listed in `refs.bib` as `harvey2022discussion`.

`report2c.pdf` is an earlier draft with a single author. It is kept on disk only and is ignored by Git.
