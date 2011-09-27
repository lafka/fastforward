{if is_set( $attribute_base )|not()}
	{def $attribute_base = 'ContentObjectAttribute'}
{/if}
{def $id = cond(
	is_set( $label ), $label,
	true(),           concat( 'ezcoa-', $attribute_base, '-', $attribute.contentclassattribute_id, '_', $attribute.contentclass_attribute_identifier )
) }
<table id="{$id} "class="list author {if $attribute.has_validation_error}error{/if}">
	{if $attribute.contentclass_attribute.description|ne('')}
		<caption>{$attribute.contentclass_attribute.description}</caption>
	{/if}

	<thead>
		<tr>
			<th class="selector">&nbsp;</th>
			<th class="name" scope="column">{'Name'|i18n( 'design/standard/content/datatype' )}</th>
			<th class="email"scope="column">{'Email'|i18n( 'design/standard/content/datatype' )}</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="3">
			{if $attribute.content.author_list}
			<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n('design/standard/content/datatype')}" title="{'Remove selected rows from the author list.'|i18n( 'design/standard/content/datatype' )}" />
			{else}
			<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n('design/standard/content/datatype')}" disabled="disabled" />
			{/if}

			<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_new_author]" value="{'Add author'|i18n('design/standard/content/datatype')}" title="{'Add a new row to the author list.'|i18n( 'design/standard/content/datatype' )}" />
			</td>
		</tr>
	</tfoot>
	{def $mod = 1}
	{foreach $attribute.content.author_list as $author}

		<tr class="{if $mod|mod(2)|eq(0)}odd{/if}">
			<th class="selector" scope="row">
				<input id="{$id}-selector-{$mod}" type="checkbox" name="{$attribute_base}_data_author_remove_{$attribute.id}[]" 
					   value="{$author.id}" title="{'Select author row for removal.'|i18n( 'design/standard/content/datatype' )}" />
			</th>
			<td class="name">
				<input id="{$id}-name-{$mod}" type="text" name="{$attribute_base}_data_author_name_{$attribute.id}[]" value="{$author.name|wash()}"/>
				<input type="hidden" name="{$attribute_base}_data_author_id_{$attribute.id}[]" value="{$author.id}" />
			</td>
			<td class="email">
				<input id="{$id}-email-{$mod}" type="text" name="{$attribute_base}_data_author_email_{$attribute.id}[]" value="{$author.email|wash}"
			</td>
		</tr>
		{set $mod = $mod|inc()}

	{/foreach}
</table>
