{if and(is_set($class)|not,is_set($module_result.content_info))}{def $class = $module_result.content_info.class_identifier}{elseif is_set($class)|not}{def $class='unknown'}{if $module_result.ui_component|eq('error')}{set $class='error'}{/if}{/if}<!DOCTYPE html>
<html>
<head>
{include uri="design:page_head.tpl"}
{include uri="design:page_head_displaystyles.tpl"}
{include uri="design:page_head_displayscripts.tpl"}

</head>
<body class="{$class}">
<div id="wrapper">
    <div id="main" class="container">
		{cache-block}
        {include uri="design:page_header.tpl"}
        {/cache-block}

        {def    $contentclass  = "span-24 lat"
                $aside         = ezini('ColumnSettings', 'ClassAside', 'design.ini')
                $asidesource   = false()
                $content       = false()}
        
        {if is_set($aside.$class)}
            {set $asidesource = "design:page_aside.tpl"}
            {set $content= concat("design:", $aside.[$class])}
            {set $contentclass  = "span-15"}
        {elseif ezini('ColumnSettings', 'DefaultAside', 'design.ini')|eq('enabled')}
            {set $asidesource   = 'design:page_aside.tpl'}
            {set $content       = concat("design:", $aside.default)};
            {set $contentclass  = "span-15"}
        {/if}        
        
        {if and(    is_string( $asidesource ),
                    ezini('ColumnSettings', 'AsidePosition',  'design.ini')|eq('before') )}
            {ezini('ColumnSettings', 'AsidePosition',  'design.ini')}
			{cache-block keys=$asidesource}
            {include uri=$asidesource content=$content}
			{/cache-block}
            {set $contentclass = $contentclass|append(" last")}
        {elseif ezini('ColumnSettings', 'ContentHasColborder', 'design.ini')|eq('enabled')}
            {set $contentclass = $contentclass|append(' colborder')}
        {/if}
        
        <section id="content" class="{$contentclass}">
            {include uri="design:page_warning.tpl"}
            {include uri="design:page_mainarea.tpl"}
        </section>
        
        {if and(    is_string( $asidesource ),
                    ezini('ColumnSettings', 'AsidePosition',  'design.ini')|eq('after') )}
			{cache-block keys=$asidesource}
            {include uri=$asidesource content=$content class="last"}
			{/cache-block}
        {/if}
        
        <div class="clear">&nbsp;</div>
    </div>
</div>
	{cache-block}
    {include uri="design:page_footer.tpl"}
	{/cache-block}
    <div class="clear">&nbsp;</div>
</body>
</html>
