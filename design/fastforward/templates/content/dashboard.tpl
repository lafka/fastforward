<div class="container">
	<h1 class="context-title">{'Dashboard'|i18n( 'design/admin/content/dashboard' )}</h1>

	<div class="row">
		{foreach $blocks as $block}
			
			<div class="{cond($block.featured, 'span12', true(), 'span6')} dashboard-item">
				{include uri=cond($block.template, concat('design:', $block.template),
         	                      true(),          concat('design:dashboard/', $block.identifier, '.tpl'))}
		</div>
		{/foreach}
	</div>
</div>
