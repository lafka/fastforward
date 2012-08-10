<form class="form-horizontal" enctype="multipart/form-data" method="post" action={concat("/content/edit/",$object.id,"/",$edit_version,"/",$edit_language|not|choose(concat($edit_language,"/"),''))|ezurl}>

	{def $errmsg = hash()}

	{if $validation.processed}
		{if or($validation.attributes, $validation.placement, $validation.custom_rules)}
			<div class="alert alert-error">
				<b>Error:</b>
					{if or(and($validation.attributes,$validation.placement),$validation.custom_rules)}
						{"Validation failed"|i18n("design/standard/content/edit")}:
					{elseif $validation.attributes}
						{"Input did not validate"|i18n("design/standard/content/edit")}
					{elseif $validation.placement}
						{"Location did not validate"|i18n("design/standard/content/edit")}:
					{else}
						{"Validation failed"|i18n("design/standard/content/edit")}:
					{/if}

				{foreach $validation.attributes as $item}
					{set $errmsg = $errmsg|merge(hash($item.identifier, $item.description))}
				{/foreach}
				{if or($validation.placement, $validation.custom_rules)}
					<ul>
						{foreach $validation.placement as $item}
							<li>{$item.text}</li>
						{/foreach}
						{foreach $validation.custom_rules as $item}
							<li>{$item.text}</li>
						{/foreach}
					</ul>
				{/if}
			</div>
		{elseif $validation_log}
			<div class="alert">
				{"Input was partially stored"|i18n("design/standard/content/edit")}
				<ul>
					{foreach $validation_log as $item}
						<li>{$item}</li>
					{/foreach}
				</ul>
			</div>
		{else}
		<div class="alert">
			{"Input was stored successfully"|i18n("design/standard/content/edit")}
		</div>
		{/if}
	{/if}

	<hgroup>
		<h1>{"Edit %1 - %2"|i18n("design/standard/content/edit",,array($class.name|wash,$object.name|wash))}</h1>
	</hgroup>

	{foreach ezini( 'EditSettings', 'AdditionalTemplates', 'content.ini' ) as $additional_tpl}
		{include uri=concat( 'design:', $additional_tpl )}
	{/foreach}

	{* Edit attribute gui's *}

	<fieldset>
		{foreach $content_attributes as $attr}
			<div class="control-group {if $attr.has_validation_error}error{/if}">
				<label class="control-label" for="{$attr.contentclass_attribute.identifier}">{$attr.contentclass_attribute.name|wash()}</label>
				<input type="hidden" name="ContentObjectAttribute_id[]" value={$attr.id} />
				<div class="controls">
					{attribute_edit_gui attribute_base=$attribute_base attribute=$attr view_parameters=$view_parameters}
					{if is_set($errmsg[$attr.contentclass_attribute.identifier])}
					<span class="help-inline">
						{$errmsg[$attr.contentclass_attribute.identifier]|wash()}
					</span>
					{/if}
				</div>
			</div>
		{/foreach}
	</fieldset>

	{*include uri="design:content/edit_placement.tpl"*}

	<div class="form-actions">
		<input type="submit" class="btn btn-primary" name="PublishButton" value="{'Send for publishing'|i18n('design/standard/content/edit')}" />
		<input class="btn" type="submit" name="StoreButton" value="{'Store draft'|i18n('design/standard/content/edit')}" />
		<input class="btn" type="submit" name="DiscardButton" value="{'Discard'|i18n('design/standard/content/edit')}" />
	</div>
</form>
