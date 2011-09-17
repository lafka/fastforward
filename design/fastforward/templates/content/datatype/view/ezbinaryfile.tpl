{if is_set($icon_size)|not()}{def $icon_size  = 'normal'}{/if}
{if is_set($icon_title)|not()}{def $icon_type = $attribute.content.mime_type}{/if}
{if is_set($icon)|not()}{def $icon            = false()}{/if}
{if $attribute.has_content}
		{if $icon|eq( true() )}
			<a href={concat("content/download/",$attribute.contentobject_id,"/",$attribute.id,"/file/",$attribute.content.original_filename)|ezurl}>{$attribute.content.mime_type|mimetype_icon( $icon_size, $icon_title )} {$attribute.content.original_filename|wash(xhtml)}</a> {$attribute.content.filesize|si(byte)}
		{else}
			<a href={concat("content/download/",$attribute.contentobject_id,"/",$attribute.id,"/file/",$attribute.content.original_filename)|ezurl}>{$attribute.content.original_filename|wash(xhtml)}</a> {$attribute.content.filesize|si(byte)}
		{/if}	
{else}
	<div class="message-error"><h2>{"The file could not be found."|i18n("design/base")}</h2></div>
{/if}
