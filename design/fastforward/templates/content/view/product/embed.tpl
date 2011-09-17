{if get_type($object)|eq('object[eZContentObjectTreeNode]')}
    {set $object = $object.object}
{/if}
{if is_set($class)|not}{def $class = ''}{/if}
	{attribute_view_gui attribute=$object.data_map.name title=true size=3 link=$object.main_node.url_alias}
	{attribute_view_gui attribute=$object.data_map.short_description}
	<p class="meta">
		<a href={$object.main_node.url_alias|ezurl} title="{$object.data_map.name.content|wash()}">{"Read more..."|i18n('design/base')}</a>
	</p>