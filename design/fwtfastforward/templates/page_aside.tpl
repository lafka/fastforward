{if is_set($content)|not}
    {def $content = 'design:error/aside/404.tpl'}
{/if}
{if is_set($pageclass)|not}

{/if}
    <html5:aside class="span-8 {$pageclass}">
        {if $content|eq('design:page_aside.tpl')}
            <h2>Default sidebar</h2>
            This is the default sidebar. You should override.
        {elseif $module_result.ui_component|eq('error')}
            {include uri='error/aside/default.tpl'}
        {else}
            {include uri=$content}
        {/if}
    </html5:aside>
