{if is_set($cssclass)|not()}
	{def $cssclass = ''}
{/if}
<div class="{$object.class_identifier} full {$cssclass}" id="object-{$object.id}">
{include uri=concat('design:content/view/', $object.class_identifier, '/full.tpl') object=$object}
</div>
