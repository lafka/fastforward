{def $pagedata         = ezpagedata()}
<!DOCTYPE html>
<html lang="{$site.http_equiv['Content-language']}">
	<head>

{foreach ezini( 'RowSettings', 'HeadRow', 'design.ini' ) as $include}
{include uri=$include module_result=$module_result pagedata=$pagedata}
{/foreach}
		
	</head>
	<body>

{foreach  ezini( 'RowSettings', 'ContentRow', 'design.ini' ) as $include}
{include uri=$include module_result=$module_result pagedata=$pagedata}
{/foreach}

	</body>
</html>
