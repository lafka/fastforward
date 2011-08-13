{if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}

{ezcss_load( array( 'websitetoolbar.css',
                      ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ),
                      ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' ) ))}
                      
<link rel="stylesheet" type="text/css" href={"stylesheets/print.css"|ezdesign()} media="print" />
