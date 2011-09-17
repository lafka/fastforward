{if $attribute.has_content|eq(true)}
    {if is_set($title)|not()}{def $title=false()}{/if}
    {if is_set($size)|not()}{def $size=2}{/if}
    {if is_set($id)}{set $id = concat(' id="',$id,'"')}{else}{def $id=''}{/if}
    {if is_set($class)}{set $class = concat(' class="',$class,'"')}{else}{def $class=''}{/if}
    {*todo* Template function to catch input variables and create key="value" to append to markup*}
    {if $title|eq(true())}<h{$size}{$id}{$class}>{/if}{if is_set($link)}<a href={$link|ezurl} title="{$attribute.data_text|wash( xhtml )}">{/if}{$attribute.data_text|wash( xhtml )}{if is_set($link)}</a>{/if}{if $title|eq(true())}</h{$size}>{/if}
{/if}