{def $frontendcss = ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' ) 
 $cssfilelist = ezini( 'StylesheetSettings', 'CSSFileList',         'design.ini' )}
 
{foreach $cssfilelist as $file}

    <link rel="stylesheet" href={concat( 'stylesheets/', $file)|ezdesign()}' media="all" />
{/foreach}
{foreach $frontendcss as $file}

    <link rel="stylesheet" href={concat( 'stylesheets/', $file)|ezdesign} media="all" />
{/foreach}
{undef $frontendcss}
{undef $cssfilelist}
