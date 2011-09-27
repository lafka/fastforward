{* Full view of object, unfortunatly there is no good way to check if a template exists except trying. *}

{* Check if it's included properly, meaning we have node and object
   this is kinda done forcefully for the reason of simplicity. You
   would never - atleast now - supply a object and a non-related node *}
{if is_set( $object )}
	{if get_class( $object )|eq( 'ezcontentobject' )}
		{def $newnode = $object.main_node}
	{else}
		{def $newnode = $object}
		{set $object  = $object.object}
	{/if}
	
	{if is_set( $node )}
		{set $node = $newnode}
	{else}
		{def $node = $newnode}
	{/if}
	
	{undef $newnode}
	
{elseif is_set( $node )}

	{if get_class( $node )|eq( 'ezcontentobjecttreenode' )}
		{def $newobject = $node.object}
	{else}
		{def $newobject = $node}
	{/if}
	
	{if is_set( $object )}
		{set $object = $newobject}
	{else}
		{def $object = $newobject}
	{/if}
	
	{undef $newobject}
	
{/if}

		<article id="full-{$object.class_identifier}-{$object.id}" class="{$object.class_identifier} full">

		{include uri=concat( 'design:content/view/', $object.class_identifier, '/full.tpl' ) object=$object node=$node}

		</article>
