	{def $user_hash = concat( $current_user.role_id_list|implode( '_' ), '_', $current_user.limited_assignment_value_list|implode( '_' ) )}

	{cache-block keys=array( $uri_string, $user_hash )}

		{include uri='design:parts/website_toolbar.tpl' current_node_id=$module_result.node_id}

	{/cache-block}

