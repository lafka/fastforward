{if get_type($object)|eq('object[eZContentObjectTreeNode]')}
    {set $object = $object.object}
{/if}
{include uri=concat('design:content/view/', $object.class_identifier, '/line.tpl') object=$object}
