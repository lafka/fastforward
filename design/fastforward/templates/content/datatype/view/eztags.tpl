{if $attribute.content.tag_ids|count}
{if and( is_set($wrap), $wrap )}
    <p class="tags">
{/if}
    {foreach $attribute.content.tags as $tag}
        <a href={concat( '/tags/view/', $tag.url )|ezurl}>{$tag.keyword|wash}</a>{delimiter}, {/delimiter}
    {/foreach}
{if and( is_set($wrap), $wrap )}
	</p>
{/if}
{/if}