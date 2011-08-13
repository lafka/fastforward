{if is_set($id)|not()}
    {def $id = concat( "frontpage-", first_set($object.id, $object.contentobject_id))}
{/if}

<div class="frontpage embedded" id="{$id}">
    {if or(is_set($title)|not(), $title|eq(true()))}
        {attribute_view_gui attribute=$object.data_map.name view=title}
    {/if}
    <p class="description">
        {attribute_view_gui attribute=$object.data_map.column}
    </p>
</div>
