		<hgroup>
			<h3><a href={$node.url_alias|ezurl()} title="{$object.data_map.name.content|wash()}">{attribute_view_gui attribute=$object.data_map.name}</a></h3>
		</hgroup>

		{attribute_view_gui attribute=$object.data_map.body}
