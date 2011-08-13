{if get_type($object)|eq('object[eZContentObjectTreeNode]')}
    {set $object = $object.object}
{/if}
{def $type = $classification|reverse()|shorten(4, '')|reverse}
{if $type|eq('flow')|not()}{set $type='list'}{/if}
{def $subtreeview = 'line'}
{def $parent = 'div'}
{switch match=$classification}
    {case match='subtree-line'}{set $subtreeview = 'line' $parent = 'ul' }{/case}
    {case match='subtree-embed'}{set $subtreeview = 'embed'}{/case}
    {case match='subtree-embed-inline'}{set $subtreeview = 'embed-inline' $parent = 'ul' }{/case}
    {case match='subtree-line-flow'}{set $subtreeview = 'line' $parent = 'ul'}{/case}
    {case match='subtree-embed-flow'}{set $subtreeview = 'embed'}{/case}
    {case match='subtree-embed-inline-flow'}{set $subtreeview = 'embed-inline'}{/case}
    {case}{/case}
{/switch}

<{$parent} class="{$type}-view">
{foreach $object.main_node.children as $child}
    {if $parent|eq('ul')}<li class="title">{/if}
    {content_view_gui content_object=$child view=$subtreeview image=true}
    {if $parent|eq('ul')}</li>{/if}
{/foreach}
    {if $parent|eq('ul')|not}<div class="clear">&nbsp;</div>{/if}
</{$parent}>