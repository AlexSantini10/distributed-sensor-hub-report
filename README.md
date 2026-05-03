# Distributed Systems Final Report

Main repository: [distributed-sensor-hub](https://github.com/AlexSantini10/distributed-sensor-hub)

## latex suggestions
Short notes from the professor template, kept here for future reuse:

1. Use `\cite{...}` with keys from `references.bib` (DBLP is a good source for BibTeX entries).
2. For images, use the `figure` environment with `\includegraphics`, then add `\caption{...}` and `\label{...}`.
3. Refer to figures with `\cref{...}`.
4. Keep images under the `figures` directory.
5. Avoid forced figure placement options like `[h]` or `[h!]`; let LaTeX manage floats.
6. Apply the same floating rule to tables/algorithms/listings.
7. Do not break lines with `\\` or `\newline`; separate paragraphs with an empty line.

## General Information
This is the template repository for the final report of the Distributed Systems course, Master's Degree in Computer Science and Engineering, University of Bologna, Campus of Cesena, Italy.

### Instructions
1. Click on the green button "Use this template" to create a new repository from this template.
2. Clone the new repository to your local machine.
3. Look at the structure of the repository and understand the purpose of each file, especially if you are not familiar with LaTeX.

### What's happening?
There is a GitHub Action that compiles the LaTeX files in the repository and creates a PDF file.
The PDF file is then uploaded as an artifact of the action.
The action is triggered on every push to the repository on specific branches (see `.github/workflows/compile.yml`).

In the action, there is also a step that improves the bibliographic references in the LaTeX files.
If you are interested in how it works, look at the script `scripts/bibtex_prettifier.rb`.

If the build fails, then it is very likely that your LaTeX files contain errors.
*READ* the error messages in the action logs to understand what is wrong.

### How to write the report
1. Edit the file `distributed-systems-final-report.tex`.
2. You can add new images in the `figures` directory.
3. If needed, you can create a `tables` directory and put your tables in it.
4. The general structure of the report is already defined in the `distributed-systems-final-report.tex` file.

## SVG Export Automation (Local Pre-Commit)
This repo includes a local hook that regenerates SVG-derived PDF assets before each commit.

### One-time setup
1. Install Inkscape and ensure `inkscape` is available in your terminal `PATH`.
2. Enable repository hooks:
```bash
git config core.hooksPath .githooks
```
3. (Optional on Unix-like systems) mark hook as executable:
```bash
chmod +x .githooks/pre-commit
```

### What it does
- Runs `scripts/export-svg-assets.ps1`.
- Regenerates `figures/design/*_svg-tex.pdf`, `*_svg-tex.pdf_tex`, and `*_svg-raw.pdf` from `figures/design/*.svg`.
- Stages regenerated assets automatically before commit.
