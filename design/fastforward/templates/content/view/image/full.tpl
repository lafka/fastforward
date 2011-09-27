{if is_set($includetext)|not()}
	{def $includetext = true()}
{/if}
		{if $includetext}
		<hgroup>
			<h1><a href={$node.url_alias|ezurl()} title="{$object.data_map.name.content|wash()}">{attribute_view_gui attribute=$object.data_map.name}</a> (<a href={""|ezurl()}>{$object.data_map.date.content.year}</a>)</h1>
		</hgroup>
		{/if}

		<a href={$node.url_alias|ezurl()} title="{$object.data_map.name.content|wash( )}">{attribute_view_gui attribute=$object.data_map.image image_class=full}</a>
		
		<address>
			{attribute_view_gui attribute=$object.data_map.location}
		</address>