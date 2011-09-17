            <html5:nav class="main horizontal">
                {def $nav = fetch('content', 'list', hash(
                    'parent_node_id', ezini('NodeSettings', 'RootNode', 'content.ini'),
                    'sort_by', array( 'priority', true() ),
                    'depth', 1))}
                {if count($nav)|gt(0)}
                <ul>
                    <li class="first{if $module_result.node_id|eq(ezini('NodeSettings', 'RootNode', 'content.ini'))} current{/if}"><a href={"/"|ezurl} title="{"Frontpage"|i18n("content")}">{"Frontpage"|i18n("content")}</a></li>
                {def $cssclass = '' $children = '' $parentclass = ''}
                {foreach $nav as $i => $item}
                    {* this is not meta-programming; so we need to build the sub menu before we display it, in case of an active subelement we need ot set the class*}
                    {if $item.children_count|gt(0)}
                        {set $children = '<ul class="child">'}
                        {foreach $item.children as $child}
                            {set $cssclass = ''}
                            {if $child.node_id|eq( $module_result.node_id)}{set $cssclass = $cssclass|append(" current") $parentclass = ' active'}{/if}
                            {set $children = $children|concat("\t\t", 
                                    '<li class="', 
                                    $cssclass, 
                                    '"><a href=',
                                    $child.url_alias|ezurl, 
                                    '>', 
                                    cond( 
                                        $child.data_map.short_name.content, $child.data_map.short_name.content, 
                                        $child.name, $child.name
                                    )|wash(), 
                                    '</a></li>'
                                )}

                        {/foreach}
                        {set $children = $children|concat('</ul>')}
                        {set $cssclass = $parentclass}
                    {else}
                        {set $children = ''}
                    {/if}
                    {*  @todo if $module_result.path containes the the id of $item, class need to be set to current-something *}
                    {if $item.node_id|eq( $module_result.node_id)}{set $cssclass = $cssclass|append(" current")}{/if}
                    <li{if $cssclass|ne('')} class="{$cssclass}"{/if}>
                        <a href={$item.url_alias|ezurl}>{cond(    $item.data_map.short_name.content, $item.data_map.short_name.content, 
                                                                $item.name, $item.name)|wash()}</a>
                    {$children}         
                    {*reset css for next item*}
                    {set $cssclass = '' $parentclass = ''}
                    </li>
                {/foreach}
                </ul>
            </html5:nav>