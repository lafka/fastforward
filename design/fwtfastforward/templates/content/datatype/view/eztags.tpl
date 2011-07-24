{def $tag = false()}

{if $attribute.content.tag_ids|count}
	<ul class="tags">
	{foreach $attribute.content.tag_ids as $tag_id}
		{set $tag = fetch(tags, object, hash(tag_id, $tag_id))}
		<li><a href={concat('/tags/view/', $tag.url)|ezurl}>{$tag.keyword|wash(xhtml)}</a></li>
	{/foreach}
        </ul>
{/if}

{undef $tag}