{def $title = '' $body = ''
    $parts = $module_result.path|extract_right(1).0.text}  
{set $parts = $parts|explode(" ")}
{set $item  = $parts|extract_right(1).0|extract(1,-1)}
{undef $parts}
{switch match=$item}
    {case match="1"}
        {set $title = "Access denied"|i18n("design/standard/error/kernel")}
        {set $body  = 'Not found<br /><br />@todo better error message'}
    {/case}
    {case match="2"}
        {set $title = "Not found"|i18n("design/standard/error/kernel")}
        {set $body  = 'Not found<br /><br />@todo better error message'}
    {/case} 
    {case match="3"}
        {set $title = "Object is unavailable"|i18n("design/standard/error/kernel")}
        {set $body  = 'Not found<br /><br />@todo better error message'}
    {/case}
    {case match="4"}
        {set $title = "Object moved"|i18n("design/standard/error/kernel")}
        {set $body  = 'Redirect or what???<br /><br />@todo better error message'}
    {/case}
    {case match="5"}
        {set $title = 'The draft could not be created. (5)'|i18n( 'design/admin/error/kernel' )}
        {set $body  = 'Invalid language code provided. The draft could not be created.'|i18n( 'design/admin/error/kernel' )}
    {/case}
    {case match="20"}
        {set $title = "Module not found"|i18n("design/standard/error/kernel")}
        {set $body  = 'Not found<br /><br />@todo better error message'}
    {/case}
    {case match="21"}
        {set $title = "View not found"|i18n("design/standard/error/kernel")}
        {set $body  = 'Not found<br /><br />@todo better error message'}
    {/case}
    {case match="22"}
        {set $title = "View is disabled"|i18n("design/standard/error/kernel",,array($parameters.check.view,$parameters.check.module))}
        {set $body  = 'Disabled view<br /><br />@todo better error message'}
    {/case}
    {case}
        {set $title = 'Unknown error'}
        {set $body  = 'An unknown error occured. We are sorry....'}
    {/case}
{/switch}

    <h2>{$title}</h2>
    <p>
        {$body}
    </p>
