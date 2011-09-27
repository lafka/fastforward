{if is_set( $node )}
	{if is_set( $delimiter )|not()}
		{def $delimiter = ' -> '}
	{/if}
	
	{if is_set( $offset )|not()}
		{def $offset = 1}
	{/if}
	
	{foreach $node.path as $parent offset $offset}
		{content_view_gui content_object=$parent view=line}
		{delimiter}{$delimiter}{/delimiter}
	{/foreach}
{/if}
