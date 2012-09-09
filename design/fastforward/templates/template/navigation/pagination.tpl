{if is_set($page_size)|not()}
	{def $page_size = 10}
{/if}
{def $prev_offset = max(0, $view_parameters.offset|sub($page_size))}
{def $next_offset = max(0, $view_parameters.offset|sum($page_size))}

<nav>
	<ul>
		{if $view_parameters.offset|gt(0)}
			<li class="prev pull-left"><a href={concat($base, '/(offset)/', $prev_offset)|ezurl()}> &laquo; Previous</a></li>
		{/if}

		{if $view_parameters.offset|sum($page_size)|lt($results)}
			<li class="next pull-right"><a href={concat($base, '/(offset)/', $next_offset)|ezurl()}>Next &raquo;</a></li>
		{/if}
	</ul>
</nav>
