{if get_type($object)|eq('object[eZContentObjectTreeNode]')}
    {set $object = $object.object}
{/if}
<div class="{$object.class_identifier} embedded inline" id="object-{$object.id}">
{include uri=concat('design:content/view/', $object.class_identifier, '/embed-inline.tpl') object=$object}
</div>
