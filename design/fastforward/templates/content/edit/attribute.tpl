{def $cssclass = ''}
{def $attrid   = ''}
{foreach $content_attributes as $attr}
	{set $cssclass = cond(
		$attr.has_validation_error, 'error',
		true(), '',
	)}
	{set $attrid = concat( $attr.contentclass_attribute.identifier, '-', $attr.id )}
		<label for="{$attrid}" class="{$cssclass}">{$attr.contentclass_attribute.name|wash()}</label>
        <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attr.id}" />
	{if and( $attr.contentclass_attribute.can_translate|eq( 0 ), $object.initial_language_code|ne( $attr.language_code ) )}
		{attribute_view_gui attribute-base=$attribute_base attribute=$attr view_parameters=$view_parameters label=$attrid}
	{else}
		{attribute_edit_gui attribute_base=$attribute_base attribute=$attr view_parameters=$view_parameters label=$attrid}
	{/if}
	
{/foreach}
