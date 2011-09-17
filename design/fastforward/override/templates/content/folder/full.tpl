<html5:section class="image">
    <div class="frame">
        {attribute_view_gui attribute=$object.data_map.image}
        
        {*$object.data_map.image.value|attribute(show,1)*}

        <html5:nav id="size">
            <ul>
                <li>@todo   $object.data_map.image.value has all image sizes.
                        Exlude some, add some and yeah make it look awesome!</li>
            </ul>
        </html5:nav>
    </div>
    <aside class="meta">
        <div class="span-4 author colborder">
            @todo fetch the avatar
            <h4><a href="#todo-userlink">Current User</a></h4>
        </div>
        <div class="span-10 last">
            <html5:hgroup>
                <h3>{$object.data_map.name.content|wash()}</h3>
                <h5>{"Posted on "|i18n("node/view")}{$object.modified|l10n(date)}</h5>
            </html5:hgroup>
            <caption>
                {$object.data_map.caption.content|wash()}
            </caption>
        </div>
    </aside>
    <div class="clear"> </div>
</html5:section>
