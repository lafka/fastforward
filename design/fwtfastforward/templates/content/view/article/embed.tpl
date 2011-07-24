{if is_set($class)|not}{def $class = ''}{/if}
<html5:article id="{$object.class_identifier}-{$object.contentobject_id}" class="embed {$class}">
        {attribute_view_gui attribute=$object.data_map.title title=true size=3 link=$object.url_alias}
        <p class="date">
            {$object.object.published|l10n('shortdate')}
        </p>
        {attribute_view_gui attribute=$object.data_map.intro}
        <p class="meta">
            <a href={$object.url_alias|ezurl} title="{$object.name|wash()}">{"Read more..."|i18n('design/base')}</a>
        </p>
</html5:article>