{* Line view of object, unfortunatly there is no good way to check if a template exists except trying. *}

{* Check if it's included properly, fix it in a half arsed attempt :) *}
{if and( is_set( $object ), is_set( $node ) )}
	{* Nothing to do *}
{elseif is_set( $object )}
	{if get_type( $object )|eq( 'eZContentObjectTreeNode' )}
		{def $node = $object}
		{set $object = $object.object}
	{else}
		{def $node = $object.main_node}
	{/if}
{elseif is_set( $node )}
	{def $object = $node.object}
{/if}

		<article id="line-{$object.class_identifier}-{$object.id}" class="{$object.class_identifier} line">

		{include uri=concat( 'design:content/view/', $object.class_identifier, '/line.tpl' ) object=$object node=$node}

		</article>
