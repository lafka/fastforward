{if get_type($object)|eq('object[eZContentObjectTreeNode]')}
	{def $node   = $object}
    {set $object = $object.object}
{else}
	{def $node    = $object.main_node}
{/if}
{if is_set($shorten)|not()}
	{def $shorten = false()}
{/if}
<html5:article class="embed">
    <div class="span-3 date">
         {$object.published|l10n('shortdate')}
    </div>
    <div class="span-11">
        {attribute_view_gui attribute=$object.data_map.name title=true size=5 link=$node.url_alias}
        {attribute_view_gui attribute=$object.data_map.description shorten=$shorten}
        <p class="meta">
            <a href={$node.url_alias|ezurl} title="{$object.name|wash()}">{"Read more..."|i18n('design/base')}</a>
        </p>
        </div>
</html5:article>