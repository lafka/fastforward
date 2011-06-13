{def $sort_order=$node.parent.sort_array[0][1]
     $sort_column=$node.parent.sort_array[0][0]
     $sort_column_value=cond(   $sort_column|eq( 'published' ),         $node.object.published,
                                $sort_column|eq( 'modified' ),          $node.object.modified,
                                $sort_column|eq( 'name' ),              $node.object.name,
                                $sort_column|eq( 'priority' ),          $node.priority,
                                $sort_column|eq( 'modified_subnode' ),  $node.modified_subnode,
                                false() 
    )
}
{if $sort_column_value|eq( false() )}
    {set $sort_column_value = $node.object.published
         $sort_column = 'published'}
{/if}
{def $fetchParams = hash(   'parent_node_id', $node.parent_node_id,
                            'attribute_filter', array(
                                'AND',
                                array(
                                    $sort_column,
                                    $sort_order|choose( '>', '<' ),
                                    $sort_column_value
                                )
                            ),
                            'sort_by', array(
                                $sort_column, $sort_order|not
                            )
)}
{def $nextParams = hash(    'attribute_filter', array( 
                                'AND', 
                                array( 
                                    $sort_column, 
                                       $sort_order|choose( '<=', '>=' ),
                                    $sort_column_value
                                )
                            ),
                            'sort_by', 
                            array(
                                $sort_column,
                                $sort_order
                            )
)}
{if is_set($class)}
    @todo CHECK THAT CLASS_FILTER_TYPE/CLASS_FILTER_ARRAY WORKS CORRECTLY
    {set $fetchParams = $fetchParams|merge( hash( 'class_filter_type', $class.class_filter_type, 'class_filter_array', $class_filter_array ) )}
{/if}
{def $previous = fetch( 'content', 'list', $fetchParams )}
{set $fetchParams = $fetchParams|merge( $nextParams )}
{def $next = fetch( 'content', 'list', $fetchParams )}
<html5:nav class="direction">
<!-- @todo fix to only show if there is a item in that direction -->
    <a class="left" href={$previous.0.url_alias|ezurl} title="{"Previous"|i18n('node/view')}">&laquo; {$previous.0.name|wash()}</a>
    <a class="right" href={$next.0.url_alias|ezurl} title="{"Previous"|i18n('node/view')}">{$next.0.name|wash()} &raquo;</a>
</html5:nav>
