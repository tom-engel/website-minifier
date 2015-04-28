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
$html = "C:\jars\htmlcompressor-x.x.x.jar"

# Path to yuicompressor
$yui = "C:\jars\yuicompressor-x.x.x.jar"

# Path to output folder
$out ="./min"

# Paths to html-containing folders
$htmlFolders = "./"

# Paths to CSS-containing folders
$cssFolders = "./css"

# Paths to js-containing folders
$jsFolders = "./js"

# Paths to CSS-files
$cssFiles = "$cssFolders/style.css"

# Paths to js-Files
$jsFiles = "$jsFolders/script.js"

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
