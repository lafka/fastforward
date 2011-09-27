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
ContentRow[Header]=design:template/header.tpl
ContentRow[Warning]=design:template/warning.tpl
ContentRow[Content]=design:template/content.tpl
ContentRow[Footer]=design:template/footer.tpl
ContentRow[Websitetoolbar]=design:template/ezwt-wrapper.tpl

#[GridSettings]
#Row[Header]=
#Row[Content]=
#
#[ContentGrid]
#Section[*]=design:template/content.tpl;design:design/aside/content.tpl
#Node[127]=design:template/content2.tpl;design:design/aside/content.tpl
#Class[frontpage]=node:2|design:custom.tpl;node:100-200|design:range.tpl

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
