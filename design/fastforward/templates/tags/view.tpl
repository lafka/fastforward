<h1>
    {$tag.keyword|wash}
</h1>

{def $nodes = fetch( content, tree, hash( parent_node_id, 2,
                                          extended_attribute_filter,
                                          hash( id, TagsAttributeFilter,
                                                params, hash( tag_id, $tag.id, include_synonyms, true() ) ),
                                          offset, first_set( $view_parameters.offset, 0 ), limit, $limit,
                                          main_node_only, true(),
                                          sort_by, array( modified, false() ) ) )}

{def $nodes_count = fetch( content, tree_count, hash( parent_node_id, 2,
                                                      extended_attribute_filter,
                                                      hash( id, TagsAttributeFilter,
                                                            params, hash( tag_id, $tag.id, include_synonyms, true() ) ),
                                                      main_node_only, true() ) )}

{if $nodes|count}
    <div class="block">
        <ul>
            {foreach $nodes as $node}
                <li>{node_view_gui content_node=$node view=embed}</li>
            {/foreach}
        </ul>
    </div>
{/if}

{include uri='design:navigator/google.tpl'
         page_uri=concat( '/tags/view/', $tag.url )
         item_count=$nodes_count
         view_parameters=$view_parameters
         item_limit=$limit}

{undef $limit $nodes $nodes_count}
