{default attribute_base='ContentObjectAttribute'
         html_class='full'}
{def $id = cond(
	is_set( $label ), $label,
	true(),           concat( 'ezcoa-', $attribute_base, '-', $attribute.contentclassattribute_id, '_', $attribute.contentclass_attribute_identifier )
) }
<input id="{$id}" class="{if $attribute.has_validation_error}error {/if}attribute {$attribute.object.content_class.identifier} {$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_ezstring_data_text_{$attribute.id}" value="{$attribute.data_text|wash( xhtml )}" />
{/default}

