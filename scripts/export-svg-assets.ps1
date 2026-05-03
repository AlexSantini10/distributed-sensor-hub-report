Param()

$ErrorActionPreference = "Stop"

function Find-Inkscape {
    $cmd = Get-Command inkscape -ErrorAction SilentlyContinue
    if ($null -ne $cmd) {
        return $cmd.Source
    }
    throw "Inkscape not found in PATH. Install Inkscape and ensure 'inkscape' is available."
}

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$designDir = Join-Path $repoRoot "figures/design"

$svgFiles = Get-ChildItem -LiteralPath $designDir -Filter "*.svg" -File
if ($svgFiles.Count -eq 0) {
    Write-Host "No SVG files found in figures/design. Nothing to export."
    exit 0
}

$inkscape = Find-Inkscape

foreach ($svg in $svgFiles) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($svg.Name)
    $pdfTexOut = Join-Path $designDir ("{0}_svg-tex.pdf" -f $baseName)
    $pdfRawOut = Join-Path $designDir ("{0}_svg-raw.pdf" -f $baseName)

    & $inkscape $svg.FullName --export-type=pdf --export-latex --export-filename=$pdfTexOut | Out-Null
    & $inkscape $svg.FullName --export-type=pdf --export-filename=$pdfRawOut | Out-Null

    Write-Host ("Exported: {0}_svg-tex.pdf(+_tex) and {0}_svg-raw.pdf" -f $baseName)
}

