<?php /* #?ini charset="utf-8"?
[ExtensionSettings]
DesignExtensions[]=fastforward

# List of javascripts to use in footer
[JavaScriptSettings]
JavaScriptFooterList[]
JavaScriptFooterList[]=fastforward.js

[StylesheetSettings]
CSSFileList[]
CSSFileList[]=fastforward.css
CSSFileList[]=websitetoolbar.css
FrontendCSSFileList[]

# The layout is devided up in rows. This list is looped through and included
# from the pagelayout.
# there are 2 different types of rows: 
#   - Head rows,   things that goes into the <head> element
#   - ContentRows, regular content that is insered into the <body>
[RowSettings]
HeadRow[]
HeadRow[]=design:template/head/title.tpl
HeadRow[]=design:template/head/meta.tpl
HeadRow[]=design:template/head/link.tpl
HeadRow[]=design:template/head/style.tpl
HeadRow[]=design:template/head/script.tpl
ContentRow[]
ContentRow[]=design:template/header.tpl
ContentRow[]=design:template/warning.tpl
ContentRow[]=design:template/content.tpl
ContentRow[]=design:template/footer.tpl
ContentRow[]=design:parts/website_toolbar.tpl

[ColumnSettings]
# Enabling DefaultAside will result in ALWAYS showing a sidebar,
# if no sidebar is defined it will display ClassAside[default]
DefaultAside=disabled
NodeAside[]
NodeAsidePosition[]
AsidePosition[]
AsidePosition[default]=after
AsidePosition[error]=before
ClassAside[]

[RowSettings]
ClassHasFeatured[]
ClassHasBottomFeatured[]
NodeHasFeatured[]
NodeHasBottomFeatured[]

[ContentSettings]
Copyright=This webpage is <a href="http://www.lovdata.no/all/nl-19610512-002.html">protected by Norwegian law</a>
*/ ?>
