		<hgroup>
			<h1>{attribute_view_gui attribute=$object.data_map.name}</h1>
		</hgroup>

		{attribute_view_gui attribute=$object.data_map.body}

		{* it's more cost-efficient to use SQL to limit that looping through children *}
		{def $params = hash(
			'parent_node_id', $node.node_id,
		)}

		{if $view_parameters.offset|ne( false() )}
			{set $params = $params|merge( hash( 'offset', $view_parameters.offset) )}
		{/if}

		{* There is no standard limit in the view_parameters *}
		{if and( is_set( $view_parameters.limit), $view_parameters.limit|not( false() ) )}
			{set $params = $params|merge( hash( 'limit', $view_parameters.limit) )}
		{/if}
		
		{* @todo implement archiving by date *}

		{def $fetch = fetch( 'content', 'list', $params )}
		
		{foreach $fetch as $child}
			{content_view_gui content_object=$child.object node=$child view='embed'}
		{/foreach}