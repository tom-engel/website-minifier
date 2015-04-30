# minify.ps1
# From github.com/tom-engel/website-minifier/
# Copyright (c) 2015 tom-engel under MIT-License
# See LICENSE for further details.
#
# Minification of html, CSS and JavaScript-files using
# htmlcompressor [https://code.google.com/p/htmlcompressor/]
# and
# yuicompressor [http://yui.github.io/yuicompressor/]

# Variables
# Path to htmlcompressor
$html = ".\test\jars\htmlcompressor-1.5.3.jar"

# Path to yuicompressor
$yui = ".\test\jars\yuicompressor-2.4.8.jar"

# Path to output folder
$out =".\test\min"

# Paths to html-containing folders
$htmlFolders = ".\test\project"

# Paths to CSS-containing folders
$cssFolders = ".\test\project\css"

# Paths to js-containing folders
$jsFolders = ".\test\project\js"

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

# Check other folders
CheckFolders $htmlFolders $out
CheckFolders $cssFolders  $out
CheckFolders $jsFolders   $out

# Compress HTML
foreach($folder in $htmlFolders) {
    java -jar $html $folder -o $out/$folder
}

# Compress CSS
foreach($file in $cssFiles) {
    java -jar $yui -o $out/$file $file
}

# Compress JavaScript
foreach($file in $jsFiles) {
    java -jar $yui -o $out/$file $file
}
