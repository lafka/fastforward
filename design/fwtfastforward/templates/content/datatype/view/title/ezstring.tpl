{if is_set($size)|not()}{def $size=2}{/if}
{if is_set($id)}{set $id = concat(' id="',$id,'"')}{else}{def $id=''}{/if}
{if is_set($class)}{set $class = concat(' class="',$class,'"')}{else}{def $class=''}{/if}
{*todo* Template function to catch input variables and create key="value" to append to markup*}
<h{$size}{$id}{$class}>{if is_set($link)}<a href={$link|ezurl} title="{$attribute.data_text|wash( xhtml )}">{/if}{$attribute.data_text|wash( xhtml )}{if is_set($link)}</a>{/if}</h{$size}>