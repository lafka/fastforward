<hgroup>
    {attribute_view_gui attribute=$object.data_map.name view=title size=2 link=$object.url_alias}
    {attribute_view_gui attribute=$object.data_map.sub_title view=title size=4}
</hgroup>
{attribute_view_gui attribute=$object.data_map.body}
<p class="meta">
    <a href={$object.url_alias|ezurl} title="{$object.data_map.name.content|wash()}">{"Read more..."|i18n('design/base')}</a>
</p>