{if and( is_set($warning_list), count($warning_list)|gt(0) )}
{$warning_list}
<div class="message">
    {foreach $warning_list as $warning}
    <h3>
    {if $warning.identifier}<a href="#{$warning.identifier}">{/if}{$warning.error.type}::{$warning.error.number}{if is_set( $warning.error.count )} ({$warning.error.count}){/if}{if $warning.identifier}</a>{/if}</h3>
    
    <p class="error">
        {$warning.text}<br />
    </p>
  {/foreach}
</div>
{/if}
