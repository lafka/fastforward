<article class="embed">
    <div class="span-3 date">
         {$object.object.published|l10n('date')}
    </div>
    <div class="span-11">
        {attribute_view_gui attribute=$object.data_map.title view=title size=5 link=$object.url_alias}
        {attribute_view_gui attribute=$object.data_map.body}
        <p class="meta">
            <a href={$object.url_alias|ezurl} title="{$object.name|wash()}">{"Read more..."|i18n('design/base')}</a>
        </p>
        </div>
</article>