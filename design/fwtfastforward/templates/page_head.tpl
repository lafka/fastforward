{def    $enable_help=true() 
        $enable_link=true()
        $disable_meta_language=true()}

{def $path=$module_result.path}
{def $reverse_path=array()}
 
{if is_set($module_result.title_path)}{set $path=$module_result.title_path}{/if}
{foreach $path as $path_item}
{set $reverse_path=$reverse_path|array_prepend($path_item)}
{/foreach}
{set-block scope=root variable=site_title}
{foreach $reverse_path as $item}{$item.text|wash}{delimiter} > {/delimiter}{/foreach} - {$site.title|wash}
{/set-block}

    <title>{$site_title}</title>
{if $site.redirect}
    <meta http-equiv="Refresh" content="{$site.redirect.timer}; URL={$site.redirect.location}" />
{/if}

{foreach $site.http_equiv as $key => $value}
	{if and( $disable_meta_language, $key|eq('Content-language') )}{continue}{/if}
    <meta http-equiv="{$key|wash}" content="{$value|wash}" />
{/foreach}

{foreach $site.meta as $key => $value}
	<meta name="{$key|wash()}" content="{$value|wash()}" />
{/foreach}

    <meta name="generator" content="eZ Publish" />
{if $enable_link}
{include uri="design:link.tpl" enable_help=$enable_help enable_link=$enable_link}
{/if}
