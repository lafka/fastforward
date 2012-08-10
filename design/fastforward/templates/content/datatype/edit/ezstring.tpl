{if is_set($disabled)|not()}
	{def $disabled = and(eq($attribute.contentclass_attribute.can_translate,0),
	                     ne($object.initial_language_code,$attr.language_code) )}
{/if}
<input type="text"
       name="{first_set($attribute_base, 'ContentObjectAttribute')}_ezstring_data_text_{$attribute.id}"
       id="{first_set($id, concat('ezcoa-', $attribute.contentclassattribute_id,
                                  '_', $attribute.contentclass_attribute_identifier))}"
       class="{first_set($class, concat('input-xlarge ezcc-', $attribute.object.content_class.identifier,
                                        'ezcca-', $attribute.object.content_class.identifier,
                                        '_', $attribute.contentclass_attribute_identifier))} {if $disabled|ne(false())}disabled{/if}"
       value="{first_set($value, $attribute.data_text)|wash( xhtml )}"
       {if $disabled|ne(false())}disabled{/if} />
