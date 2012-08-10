{if and( is_set($warning_list), count($warning_list)|gt(0) )}
	<section id="warning" class="warning container">

		{foreach $warning_list as $warning}

		<h6>
			{if $warning.identifier}
				<a href="#{$warning.identifier}">
			{/if}
			{$warning.error.type} / {$warning.error.number}{if is_set( $warning.error.count )} ({$warning.error.count}){/if}
			{if $warning.identifier}</a>{/if}
		</h6>
		<p>
			{$warning.text}
		</p>

		{/foreach}

	</section>
{/if}
