{foreach $site.http_equiv as $key => $value}
		{* Content-language is deprecated in meta and is set in the root element instead*}
		{if $key|eq( 'Content-language' )}{continue}{/foreach}

		<meta http-equiv="{$key|wash( )}" content="{$value|wash( )}" />
{/foreach}
{*foreach $site.meta as $key => $value}
		<meta name="{$key|wash( )}" content="{$value|wash( )}" />

{/foreach*}
