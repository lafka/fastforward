<html5:hgroup>
    {attribute_view_gui attribute=$object.data_map.name title=true size=2 link=$object.url_alias}
    {attribute_view_gui attribute=$object.data_map.sub_title title=true size=4}
</html5:hgroup>
{attribute_view_gui attribute=$object.data_map.body}
<p class="meta">
    <a href={$object.url_alias|ezurl} title="{$object.data_map.name.content|wash()}">{"Read more..."|i18n('design/base')}</a>
</p>