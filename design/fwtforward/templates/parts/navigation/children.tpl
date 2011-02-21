{def $nodecount = fetch('content', 'list_count', hash('parent_node_id', $module_result.node_id))}
        {if $nodecount|gt(0)}
            {def $content = fetch( 'content', 'object', hash('object_id', $module_result.content_info.object_id))}
            <h3 >{$content.name|wash} ({$nodecount})</h3>
            
            {def $children = fetch('content', 'list', hash('parent_node_id', $module_result.node_id))}
            <ul>
                {foreach $children as $child}
                    {content_view_gui content_object=$child view=line list=true}
                {/foreach}
            </ul>
        {else}
            <p class="error">
                {"The node has no children"|i18n("content/node")}
            </p>
        {/if}
