<?php /* #?ini charset="utf-8"?
# eZ publish configuration file for modules

[ExtensionSettings]
DesignExtensions[]=fwtforward

# List of javascripts to use in footer
[JavaScriptSettings]
JavaScriptFooterList[]

[StylesheetSettings]
CSSFileList[]
#CSSFileList[]=html5.css
CSSFileList[]=src/reset.css
CSSFileList[]=src/grid.css
CSSFileList[]=src/typography.css
CSSFileList[]=src/forms.css
CSSFileList[]=src/grid.css
CSSFileList[]=plugins/silk-icons/sprite.css
CSSFileList[]=menu.css
FrontendCSSFileList[]
FrontendCSSFileList[]=screen.css

[ColumnSettings]
# Enabling DefaultAside will result in ALWAYS showing a sidebar,
# if no sidebar is defined it will display ClassAside[default]
DefaultAside=disabled
AsidePosition=after
ContentHasColborder=enabled
ClassAside[]
ClassAside[default]=parts/navigation/children.tpl
ClassAside[folder]=parts/navigation/series.tpl
ClassAside[error]=error/aside/default.tpl

[RowSettings]
ClassHasFeatured[]
ClassHasBottomFeatured[]
*/ ?>
