{if is_set($object)|not}
    {def $object = $node}
{/if}
{if is_set($object_parameters)|not}
    {def $object_parameters = hash( 'size', 'small' )}
{/if}
<div class="image" id="object-{$object.id}">
    {if $object.data_map.caption.has_content}
        <span class="attribute image">
            {if is_set( $link_parameters.href )}
                {attribute_view_gui attribute=$object.data_map.image 
                    image_class=$object_parameters.size 
                    href=$link_parameters.href|ezurl 
                    target=$link_parameters.target 
                    link_class=first_set( $link_parameters.class, '' ) 
                    link_id=first_set( $link_parameters['xhtml:id'], '' ) 
                    link_title=first_set( $link_parameters['xhtml:title'], '' )} 
            {else}
                {attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size href=$object.data_map.image.object.main_node.url_alias|ezurl link_title=$object.name|wash}
            {/if}

        </span>
        <span class="attribute caption">
            {attribute_view_gui attribute=$object.data_map.caption}
        </span>
    {/if}
</div>

