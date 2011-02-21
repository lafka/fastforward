<article id="node-{$node.main_node_id}" class="content-view full {$node.object.class_identifier}">
    <hgroup>
        <h1>{$node.name|wash()}</h1>
    </hgroup>
    
    {if and( is_set($node.data_map.image),$node.data_map.image.has_content)}
        {content_view_gui content_object = $node.data_map.image.content view=full}
    {/if}
    
{def $name_pattern = $node.object.content_class.contentobject_name|explode('>')|implode(',') $name_pattern_array = array('enable_comments', 'enable_tipafriend', 'show_children', 'show_children_exclude', 'show_children_pr_page')}
{set $name_pattern  = $name_pattern|explode('|')|implode(',')}
{set $name_pattern  = $name_pattern|explode('<')|implode(',')}
{set $name_pattern  = $name_pattern|explode(',')}
{foreach $name_pattern  as $name_pattern_string}
{set $name_pattern_array = $name_pattern_array|append( $name_pattern_string|trim() )}
{/foreach}
    {foreach $node.object.contentobject_attributes as $attribute}
        {if $name_pattern_array|contains($attribute.contentclass_attribute_identifier)|not()}
            {attribute_view_gui attribute=$attribute}
        {/if}
    {/foreach}
</article>
