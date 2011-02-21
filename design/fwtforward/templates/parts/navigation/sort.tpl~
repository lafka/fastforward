{def $node = fetch('content', 'object', hash( 'object_id', $#module_result.content_info.object_id))}
{$node|attribute(show)}
{if ezini( 'Sorting', 'Sorting', 'content.ini')|eq('enabled')}
    {def $order     = first_set($#view_parameters.order, 'DESC')}
    {def $sort      = first_set($#view_parameters.sort, 'published')}
    {def $sorting   = ezini( 'Sorting', 'AllowSort', 'content.ini')}
    <ul class="sort">
    {foreach $sorting as $type => $status}
        {if $status|eq('enabled')}
        <li><a href={concat($#module_result.content_info.url_alias, "/(sort)/",$type, '/(order)/', $order)|ezurl}>{"Sort by %type"|i18n('content/fwt/sorting', '', hash('%type', $type) )}</a></li>
        {/if}
    {/foreach}
    </ul>
    <p class="sort">
        <a href={"Order %order"|i18n("content/fwt/sorting", "", hash( '%order', concat( $order, 'ending')|downcase))}
    </p>
{/if}
