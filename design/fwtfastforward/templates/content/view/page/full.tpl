{if is_set($object)|not}
    {def $object = $node}
{/if}
<html5:article class="article" id="object-{$object.contentobject_id}">
    {attribute_view_gui attribute=$object.data_map.title title=true}

    {attribute_view_gui attribute=$object.data_map.author}
    
    {attribute_view_gui attribute=$object.data_map.intro class=bold wrap=div}

    {attribute_view_gui attribute=$object.data_map.body}

    {foreach $object.object.related_contentobject_array as $relation}
        {content_view_gui content_object=$relation}
    {/foreach}
</html5:article>