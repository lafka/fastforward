		{ezcss_load( array( ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ),
                    ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' ) ) ) }
		<link rel="Alternate" href={concat( "layout/set/print/",$site.uri.original_uri)|ezurl( )} media="print" title="{'Printable version'|i18n( 'design/standard/layout' )}" />
