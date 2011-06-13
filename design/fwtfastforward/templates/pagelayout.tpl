{if and(is_set($pageclass)|not,is_set($module_result.content_info))}{def $pageclass = $module_result.content_info.class_identifier}{elseif is_set($pageclass)|not}{def $pageclass='unknown'}{if $module_result.ui_component|eq('error')}{set $pageclass='error'}{/if}{/if}{if $module_result.node_id|eq(ezini('NodeSettings', 'RootNode', 'content.ini'))}{set $pageclass='frontpage'}{/if}<!DOCTYPE html>
{def $pagedata         = ezpagedata()
     $locales          = fetch( 'content', 'translation_list' )
     $pagedesign       = $pagedata.template_look
     $current_node_id  = $pagedata.node_id}
<html>
<head>
{include uri="design:page_head.tpl"}
{include uri="design:page_head_displaystyles.tpl"}
{include uri="design:page_head_displayscripts.tpl"}

</head>
<body class="{$pageclass}">
<div id="wrapper">
    <div id="main" class="container">
        {cache-block}
        {include uri="design:page_header.tpl"}
        {/cache-block}

        {def    $contentclass  = "span-24 lat"
                $aside         = ezini('ColumnSettings', 'ClassAside', 'design.ini')
                $asidesource   = false()
                $content       = false()
                $positions      = ezini('ColumnSettings', 'AsidePosition',  'design.ini')}
        
        {if is_set($aside.$pageclass)}
            {set $asidesource = "design:page_aside.tpl"}
            {set $content= concat("design:", $aside.[$pageclass])}
            {set $contentclass  = "span-15"}
        {elseif ezini('ColumnSettings', 'DefaultAside', 'design.ini')|eq('enabled')}
            {set $asidesource   = 'design:page_aside.tpl'}
            {set $content       = concat("design:", $aside.default)};
            {set $contentclass  = "span-15"}
        {/if}        
        
        {if is_set($positions[$pageclass])|not}{set $pageclass = 'default'}{/if}
        {if and(    is_string( $asidesource ),
                    $positions[$pageclass]|eq('before') )}
            {ezini('ColumnSettings', 'AsidePosition',  'design.ini')}
            {cache-block keys=$asidesource}
            {include uri=$asidesource content=$content}
            {/cache-block}
            {set $contentclass = $contentclass|append(" last")}
        {elseif ezini('ColumnSettings', 'ContentHasColborder', 'design.ini')|eq('enabled')}
            {set $contentclass = $contentclass|append(' colborder')}
        {/if}

        {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
            {include uri='design:page_toolbar.tpl'}
        {/if}

        <section id="content" class="{$contentclass}">
            {include uri="design:page_warning.tpl"}
            {include uri="design:page_mainarea.tpl"}
        </section>
        
        {if and(    is_string( $asidesource ),
                    $positions[$pageclass]|eq('after') )}
            {cache-block keys=$asidesource}
            {include uri=$asidesource content=$content class="last"}
            {/cache-block}
        {/if}
        
        <div class="clear"> </div>
    </div>
</div>
    {cache-block}
    {include uri="design:page_footer.tpl"}
    {/cache-block}
    <div class="clear"> </div>
</body>
</html>
