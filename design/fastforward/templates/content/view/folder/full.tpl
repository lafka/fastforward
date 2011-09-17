<html5:article id="node-{$node.main_node_id}" class="content-view full {$node.object.class_identifier}">
    <html5:hgroup>
        {attribute_view_gui attribute=$node.object.data_map.name title=true size=1}
    </html5:hgroup>
    
{def $name_pattern = $node.object.content_class.contentobject_name|explode('>')|implode(',') $name_pattern_array = array('enable_comments', 'enable_tipafriend', 'show_children', 'show_children_exclude', 'show_children_pr_page')}
{set $name_pattern  = $name_pattern|explode('|')|implode(',')}
{set $name_pattern  = $name_pattern|explode('<')|implode(',')}
{set $name_pattern  = $name_pattern|explode(',')}
{foreach $name_pattern  as $name_pattern_string}
{set $name_pattern_array = $name_pattern_array|append( $name_pattern_string|trim() )}
{/foreach}
    {attribute_view_gui attribute=$node.data_map.description}
</html5:article>
{def $i = 0
     $cssclass = ''}
{if and($node.is_container, count($node.children)|gt(0))}
    {foreach $node.children as $child}
		{set $i = $i|inc()}
		{set $cssclass = ''}
		{if $i|mod(3)|eq(0)}
			{set $cssclass = 'last'}
		{/if}
        {content_view_gui content_object=$child view=embed cssclass=$cssclass}
    {/foreach}
{/if}
