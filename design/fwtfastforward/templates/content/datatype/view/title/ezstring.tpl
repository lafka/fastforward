{if is_set($size)|not()}{def $size=2}{/if}
{if is_set($id)}{set $id = append(' id="',$id,'"')}{else}{def $id=''}{/if}
{if is_set($class)}{set $class = append(' class="',$class,'"')}{else}{def $class=''}{/if}
{*todo* Template function to catch input variables and create key="value" to append to markup*}
{if is_set($link)}<a href={$link|ezurl} title="{$attribute.data_text|wash( xhtml )}">{/if}<h{$size}{$id}{$class}>{$attribute.data_text|wash( xhtml )}</h{$size}>{if is_set($link)}</a>{/if}