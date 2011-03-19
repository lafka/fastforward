{def $frontendjss = ezini(  'JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini' ) 
 $jsfilelist = ezini(   'JavaScriptSettings', 'JavaScriptList',         'design.ini' )}
{foreach ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini') as $item}

    <script type="text/javascript" src={concat( 'javascript/',$:item )|ezdesign}></script>
{/foreach}
{foreach ezini( 'JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini') as $item}

    <script type="text/javascript" src={concat( 'javascript/',$:item )|ezdesign}></script>
{/foreach}
{undef $frontendjss}
{undef $jsfilelist}
{ezscript_load( array( ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ), ezini( 'JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini' ) ) )}