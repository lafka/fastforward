
<html5:hgroup>
    {attribute_view_gui attribute=$object.data_map.name title=true size=2 link=$object.main_node.url_alias}
</html5:hgroup>

{if $object.data_map.column.has_content}
	{attribute_view_gui attribute=$object.data_map.column}
{else}
	{attribute_view_gui attribute=$object.data_map.body}
{/if}
