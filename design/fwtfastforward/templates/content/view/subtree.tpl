{if get_type($object)|eq('object[eZContentObjectTreeNode]')}
    {set $object = $object.object}
{/if}
<ul class="list-view">
{foreach $object.main_node.children as $child}
    {content_view_gui content_object=$child view=line list=true() listclass=title image=true}
{/foreach}
</ul>