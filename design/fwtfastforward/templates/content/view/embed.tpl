{if is_set($cssclass)|not()}
	{def $cssclass = ''}
{/if}
<div class="{$object.class_identifier} embedded {$cssclass}" id="object-{$object.id}">
{include uri=concat('design:content/view/', $object.class_identifier, '/embed.tpl') object=$object}
</div>
