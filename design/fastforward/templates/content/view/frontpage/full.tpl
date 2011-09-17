{if $node.is_container}
    {if $node.children_count|gt(0)}
		{$module_result|attribute(show)}
		{def $subtree = fetch( 'content', 'list', hash(
		    'parent_node_id', $node.node_id,
			'limit',          $limit,
			'offset',         $offsetm
			'sort_by'.        array( $sortby, $order )
		) ) }
        {foreach $subtree as $child max $limit offset $offset}
            {content_view_gui content_object=$child view="embed"}
        {/foreach}
    {else}
        {"The current item does not contain any sub items"|i18n("design/admin/node/view/full")}
    {/if}
{/if}

{*$node|attribute(show)*}
