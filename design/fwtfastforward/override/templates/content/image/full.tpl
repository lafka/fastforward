<html5:section class="image">
    <div class="frame">
        {include uri="design:parts/navigation/direction.tpl"}
        <div class="clear"> </div>
        <div class="image">
        {attribute_view_gui attribute=$node.data_map.image}
        </div>
        <nav id="size">
            <ul>
                {*Start with a offset of 3 to skip text indexes*}
                {def $i = 3}
                {while ne( $i, $node.data_map.image.content|count)}
                    {set $i=$i|inc}
                    {$i}
                {/while}
            </ul>
        </nav>
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
