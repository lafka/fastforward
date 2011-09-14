<h4><a href={$object.main_node.url_alias|ezurl()}>{$object.name|wash()}</a></h4>

{if $object.data_map.description.has_content}
<div class="attribute-short">
	{attribute_view_gui attribute=$object.data_map.description}
</div>
{/if}

<div class="attribute-file">
	<p>{attribute_view_gui attribute=$object.data_map.file icon_size='small' icon_title=$object.name icon='yes'}</p>
</div>
