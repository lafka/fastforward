{if is_set($object)|not}
    {def $object = $node}
{/if}
<article class="article" id="object-{$object.contentobject_id}">
    {attribute_view_gui attribute=$object.data_map.title view=title}

    {attribute_view_gui attribute=$object.data_map.author}
    
    {attribute_view_gui attribute=$object.data_map.intro class=bold wrap=div}

    {attribute_view_gui attribute=$object.data_map.body}

    {foreach $object.object.related_contentobject_array as $relation}
        {content_view_gui content_object=$relation}
    {/foreach}
</article>