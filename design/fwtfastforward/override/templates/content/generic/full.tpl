<section class="{$node.object.class_identifier|wash}">
    {attribute_view_gui attribute=$node.object.data_map.name view=title size=1}
    
    {foreach $node.object.data_map as $attribute}
        {attribute_view_gui attribute=$attribute}
    {/foreach}
</section>