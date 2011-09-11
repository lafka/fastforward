<form name="editform" id="editform" enctype="multipart/form-data" method="post" action={concat( '/content/edit/', $object.id, '/', $edit_version, '/', $edit_language|not|choose( concat( $edit_language, '/' ), '/' ), $is_translating_content|not|choose( concat( $from_language, '/' ), '' ) )|ezurl}>

{* This is to force form to use publish action instead of 'Manage version' button on enter key press in input and textarea elements. *}
<input class="defaultbutton hide" type="submit" id="ezedit-default-button" name="PublishButton" value="{'Send for publishing'|i18n( 'design/admin/content/edit' )}" />

{* Current gui locale, to be used for class [attribute] name & description fields *}
{def $content_language = ezini( 'RegionalSettings', 'Locale' )}

<h1 class="context-title">{$object.class_identifier|class_icon( normal, $object.class_name )}&nbsp;{'Edit <%object_name> (%class_name)'|i18n( 'design/admin/content/edit',, hash( '%object_name', $object.name, '%class_name', first_set( $class.nameList[$content_language], $class.name ) ) )|wash}</h1>

{include uri='design:content/edit_validation.tpl'}

<div>
<p class="column class-description">
    {first_set( $class.descriptionList[$content_language], $class.description )|wash}
</p>
<p class="column translation">
{let language_index=0
     from_language_index=0
     translation_list=$content_version.translation_list}

{section loop=$translation_list}
  {if eq( $edit_language, $item.language_code )}
    {set language_index=$:index}
  {/if}
{/section}

{if $is_translating_content}

    {let from_language_object=$object.languages[$from_language]}

    {'Translating content from %from_lang to %to_lang'|i18n( 'design/admin/content/edit',, hash(
        '%from_lang', concat( $from_language_object.name, '&nbsp;<img src="', $from_language_object.locale|flag_icon, '" width="18" height="12" style="vertical-align: middle;" alt="', $from_language_object.locale, '" />' ),
        '%to_lang', concat( $translation_list[$language_index].locale.intl_language_name, '&nbsp;<img src="', $translation_list[$language_index].language_code|flag_icon, '" width="18" height="12" style="vertical-align: middle;" alt="', $translation_list[$language_index].language_code, '" />' ) ) )}

    {/let}

{else}

    {$translation_list[$language_index].locale.intl_language_name}&nbsp;<img src="{$translation_list[$language_index].language_code|flag_icon}" width="18" height="12" style="vertical-align: middle;" alt="{$translation_list[$language_index].language_code}" />

{/if}

{/let}
</p>
<div class="clear"> </div>
</div>

<div class="context-attributes">
    {include uri='design:content/edit_attribute.tpl' view_parameters=$view_parameters}
</div>

<p>
    <input class="defaultbutton" type="submit" name="PublishButton" value="{'Send for publishing'|i18n( 'design/admin/content/edit' )}" title="{'Publish the contents of the draft that is being edited. The draft will become the published version of the object.'|i18n( 'design/admin/content/edit' )}" />
    <input class="button" type="submit" name="StoreButton" value="{'Store draft'|i18n( 'design/admin/content/edit' )}" title="{'Store the contents of the draft that is being edited and continue editing. Use this button to periodically save your work while editing.'|i18n( 'design/admin/content/edit' )}" />
    <input class="button" type="submit" name="StoreExitButton" value="{'Store draft and exit'|i18n( 'design/admin/content/edit' )}" title="{'Store the draft that is being edited and exit from edit mode. Use when you need to exit your work and return later to continue.'|i18n( 'design/admin/content/edit' )}" />
    <input class="button" type="submit" name="DiscardButton" value="{'Discard draft'|i18n( 'design/admin/content/edit' )}" onclick="return confirmDiscard( '{'Are you sure you want to discard the draft?'|i18n( 'design/admin/content/edit' )|wash(javascript)}' );" title="{'Discard the draft that is being edited. This will also remove the translations that belong to the draft (if any).'|i18n( 'design/admin/content/edit' ) }" />
</p>
<!-- Maincontent START -->




