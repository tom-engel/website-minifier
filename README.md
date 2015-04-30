# minify.ps1
A PowerShell script to minify typical website-projects with html, CSS and JavaScript-files.

### Used compressors
  * [htmlcompressor](https://code.google.com/p/htmlcompressor/) for html
  * [YUI Compressor](http://yui.github.io/yuicompressor/) for css and JavaScript

### Usage
Download [minify.ps1](https://raw.githubusercontent.com/tom-engel/website-minifier/master/minify.ps1) and the compressors listed above. Put the script into your project folder. Specify the paths to html, CSS and JavaScript-files in the script (Section `# Variables`).

#### Parameters
  * `-html` for html-files
  * `-css` for CSS-files
  * `-js` for JavaScript-files
  * No parameters for all
