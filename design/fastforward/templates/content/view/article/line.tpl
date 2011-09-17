{* Article - Line view *}
{if is_set($title)|not}{def $title = false()}{/if}
{if is_set($wrap)|not}{def $wrap = false()}{/if}
{if $wrap}
<div class="content-view-line">
    <div class="class-article float-break">
{/if}
    {if $title}<h2>{/if}<a href={$object.main_node.url_alias|ezurl}>{$object.data_map.title.content|wash}</a>{if $title}</h2>{/if}
{if $wrap}
    </div>
</div>
{/if}