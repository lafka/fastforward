{def $pagedata         = ezpagedata()}
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:html5="http://www.w3.org/1999/xhtml">
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
