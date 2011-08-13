{if get_type($object)|eq('object[eZContentObjectTreeNode]')}
    {set $object = $object.object}
{/if}
{foreach $object.main_node.children as $child}
    {content_view_gui content_object=$child view=embed}
{/foreach}
