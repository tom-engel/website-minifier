# minify.ps1
# From github.com/tom-engel/website-minifier/
# Copyright (c) 2015 tom-engel under MIT-License
# See LICENSE for further details.
#
# Minification of html, CSS and JavaScript-files using
# htmlcompressor [https://code.google.com/p/htmlcompressor/]
# and
# yuicompressor [http://yui.github.io/yuicompressor/]

# Parameters
Param(  
  [switch]$html,
  [switch]$css,
  [switch]$js
)

if ($args.Count -eq 0) {
  $html = $true
  $css = $true
  $js = $true
}

# Variables
# Path to htmlcompressor
$htmlcomp = ".\test\jars\htmlcompressor-1.5.3.jar"

# Path to yuicompressor
$yuicomp = ".\test\jars\yuicompressor-2.4.8.jar"

# Path to output folder
$out =".\test\min"

# Paths to html-containing folders
$htmlFolders = ".\"

# Paths to CSS-containing folders
$cssFolders = ".\css"

# Paths to js-containing folders
$jsFolders = ".\js"

# Paths to CSS-files
$cssFiles = "$cssFolders/style.css"

# Paths to js-Files
$jsFiles = "$jsFolders/grolb.js"

# Functions
# Check if out-folders exist. If not, create them
# IN: $folders: Array with folders / folder
# IN: $out: path to output folder
Function CheckFolders($folders, $out) {

  foreach($folder in $folders) {
    if (-Not (Test-Path $out/$folder)) {
        mkdir $out/$folder
    }
  }
}

# Check out-folder
if (-Not (Test-Path $out)) {
    mkdir $out
}

# Compress HTML
if($html) {
  CheckFolders $htmlFolders $out
  foreach($folder in $htmlFolders) {
    java -jar $htmlcomp $folder -o $out/$folder
  }
}


# Compress CSS
if ($css) {
  foreach($file in $cssFiles) {
    CheckFolders $cssFolders  $out
    java -jar $yuicomp -o $out/$file $file
  }
}

# Compress JavaScript
if ($js) {
  CheckFolders $jsFolders   $out
  foreach($file in $jsFiles) {
    java -jar $yuicomp -o $out/$file $file
  }
}

