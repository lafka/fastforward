		<link rel="Home"          href={"/"|ezurl( )} title="{'%sitetitle front page'|i18n( 'design/standard/layout', , hash( '%sitetitle', $site.title ) )|wash( )}" />
		<link rel="Index"         href={"/"|ezurl( )} />
		<link rel="Top"           href={"/"|ezurl( )} title="{$site.title}" />
		<link rel="Search"        href={"content/search"|ezurl( )} title="{'Search %sitetitle'|i18n( 'design/standard/layout', , hash('%sitetitle', $site.title))|wash( )}" />
		<link rel="Shortcut icon" href={"favicon.ico"|ezimage( )} type="image/x-icon" />
		{*
		<link rel="Copyright"     href={"/ezinfo/copyright"|ezurl( )} />
		<link rel="Author"        href={"/ezinfo/about"|ezurl( )} />
		*}

		{if is_set($module_result.content_info)}
		<link rel="canonical"     href={$module_result.content_info.url_alias|ezurl(yes, full)} />
		{/if}
