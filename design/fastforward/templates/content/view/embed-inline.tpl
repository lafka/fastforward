{* Embed inline view of object *}

{* Check if it's included properly, meaning we have node and object*}
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

		<article id="embed-inline-{$object.class_identifier}-{$object.id}" class="{$object.class_identifier} embed-inline">

		{include uri=concat( 'content/view/', $object.class_identifier, '/full.tpl' ) object=$object node=$node}

		</article>
