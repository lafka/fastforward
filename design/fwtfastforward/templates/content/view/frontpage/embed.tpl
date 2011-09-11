{if get_type($object)|eq('object[eZContentObjectTreeNode]')}
    {set $object = $object.object}
{/if}{if is_set($id)|not()}
    {def $id = concat( "frontpage-", first_set($object.id, $object.contentobject_id))}
{/if}

<div class="frontpage embed" id="{$id}">
    {if or(is_set($title)|not(), $title|eq(true()))}
        {$object.main_node.name}
    {/if}
    {if $object.data_map.column.has_content}
        {attribute_view_gui attribute=$object.data_map.column}
    {else}
        {attribute_view_gui attribute=$object.data_map.body}
    {/if}
</div>
