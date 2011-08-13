{if $node.is_container}
    {if $node.children_count|gt(0)}
        {foreach $node.children as $child}
            {content_view_gui content_object=$child view="embed"}
        {/foreach}
    {else}
        {"The current item does not contain any sub items"|i18n("design/admin/node/view/full")}
    {/if}
{/if}

{*$node|attribute(show)*}
