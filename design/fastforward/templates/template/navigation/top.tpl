{def $menu = treemenu( $module_result.path , , array( 'frontpage', 'folder', 'page' ), , 1)}
{def $rootnode = ezini( 'NodeSettings', 'RootNode', 'content.ini' )}
{if ezini( 'MenuSettings', 'ShowFrontpageItem', 'menu.ini' )|eq( 'enabled' )}
	{def $root = fetch( 'content', 'node', hash( 
		'node_id', $rootnode ) ) }
	{set $menu = $menu|prepend( hash( 
			'id',           $root.node_id,
			'level',        0,
			'class_name',   $root.class_name,
			'is_main_node', $root.is_main,
			'indent',       0,
			'url_alias',    $root.url_alias,
			'url_string',   $root.url_alias,
			'text',         $root.name,
			'is_selected',  $root.node_id|eq( $module_result.node_id ),
			'node',         $root
	) ) }
	{undef $root}
{/if}

		<nav id="top">
			<ul>
			{foreach $menu as $item}
			
				<li class="{if $item.is_selected}current{/if}">
					<a href={$item.url_alias|ezurl}>{$item.text|wash}</a>
				{if and( $item.node.children_count|gt(0), $rootnode|ne( $item.id ) )}

					<ul class="child">
					{foreach $item.node.children as $child}
						<li class=""><a href={$child.url_alias|ezurl()} title="{$child.name|wash()}">{$child.name|wash()}</a></li>
					{/foreach}

					</ul>
				{/if}

				</li>
				{/foreach}

			</ul>
		</nav>




{*
		{if or( $item.id|eq($rootnode), and($item.node.path_array|contains($module_result.node_id), $rootnode|ne($item.id))}current {/if}
		<li class="{if $item.is_selected}current{/if}"><a href={$item.url_alias|ezurl}>{$item.text|wash}</a>{if $item.node.has_children}{include uri='design:template/navigation/child.tpl' node=$node}{/if}</li>
*}