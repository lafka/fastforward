{if is_set($object)|not}
    {def $object = $node}
{/if}
<html5:article class="article" id="object-{$object.contentobject_id}">
    {attribute_view_gui attribute=$object.data_map.title title=true}

    {if and($object.data_map.featured.content|eq(1), $object.data_map.image.has_content)}
        <div class="frame no-margin">
            {attribute_view_gui attribute=$object.data_map.image image_class=imagelarge}
            {attribute_view_gui attribute=$object.data_map.caption}
        </div>
    {/if}

    {attribute_view_gui attribute=$object.data_map.intro class="bold start" wrap=div}

    <hr />
    <p><i>{"Published %date"|i18n('design/content/view', '', hash('%date', $object.object.published|l10n('date')))}</i></p>

    {attribute_view_gui attribute=$object.data_map.body}

{*    <div class="relations clear">

    {foreach $object.object.related_contentobject_array as $relation}
        {content_view_gui content_object=$relation view=embed}
    {/foreach}

    </div>
*}  
    {* Tags *}
    {*if is_set($object.data_map.tags)}
        <h4>{"Tags"|i18n("extension/eztags/datatypes")}</h4>
        {attribute_view_gui attribute=$object.data_map.tags}
    {/if*}

    {*if $object.data_map.enable_comments.content|eq(1)}
        <h2>{"Comments"|i18n("design/base")}</h2>
        <hr />
        <p>
            <!-- @todo: Localize -->
            Comments are currently turned off.
        </p>
    {/if*}
</html5:article>
