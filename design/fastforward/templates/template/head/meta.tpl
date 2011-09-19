{foreach $site.http_equiv as $key => $value}
		<meta http-equiv="{$key|wash( )}" content="{$value|wash( )}" />

{/foreach}
{foreach $site.meta as $key => $value}
		<meta name="{$key|wash( )}" content="{$value|wash( )}" />

{/foreach}
