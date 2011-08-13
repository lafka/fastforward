{if get_type($object)|eq('object[eZContentObjectTreeNode]')}
    {set $object = $object.object}
{/if}
{if is_set($class)|not}{def $class = ''}{/if}
<html5:article id="{$object.class_identifier}-{$object.id}" class="embed {$class}">
        {attribute_view_gui attribute=$object.data_map.title title=true size=3 link=$object.main_node.url_alias}
        <p class="date">
            {$object.published|l10n('shortdate')}
        </p>
        {attribute_view_gui attribute=$object.data_map.intro}
        <p class="meta">
            <a href={$object.main_node.url_alias|ezurl} title="{$object.data_map.title.content|wash()}">{"Read more..."|i18n('design/base')}</a>
        </p>
</html5:article>