    <header>
        <div id="branding" class="span-9">
            <h1 class="title">{ezini('SiteSettings','SiteName')|wash}</h1>
            <h3 class="slogan">@todo site-slogan</h3>
        </div>
        <nav>
            {def $nav = fetch('content', 'list', hash(
                'parent_node_id', ezini('NodeSettings', 'RootNode', 'content.ini'),
                'sort_by', array( 'priority', false() ),
                'attribute_filter', array('and', array('folder/menu', '!=', false)),
                'depth', 1))}
            {if count($nav)|eq(0)}
            <p>Det fantes ingen underelementer. Er noe galt?</p>
            {else}
            <ul>
            {foreach $nav as $i => $item}
                <li{if $i|eq(0)} class="first"{elseif $item.node_id|eq( $module_result.node_id)} class="current"{/if}>
                    <a href={$item.url_alias|ezurl}>{$item.name|wash}</a>
                {if $item.children_count|gt(0)}
                    <ul class="child">
                        {foreach $item.children as $child}
                            <li><a href={$child.url_alias|ezurl}>{$child.name|wash}</a></li>
                        {/foreach}
                    </ul>
                {/if}
                </li>
            {/foreach}
            {/if}
            </ul>
        </nav>
        <div class="clear">&nbsp;</div>
    </header>

