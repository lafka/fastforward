{if is_set($content)|not}
    {def $content = 'design:error/aside/404.tpl'}
{/if}
{if is_set($pageclass)|not()}
	{def $pageclass = ''}
{/if}
{if $position|eq('after')}
	{set $pageclass = concat( $pageclass, ' last' )}
{else}
	{set $pageclass = concat( $pageclass, ' push-1' )}
{/if}
    <html5:aside class="push-1 span-8 {$pageclass}">
        {if $content|eq('design:page_aside.tpl')}
            <h2>Default sidebar</h2>
            This is the default sidebar. You should override.
        {else}
            {include uri=$content module_result=$module_result}
        {/if}
    </html5:aside>
