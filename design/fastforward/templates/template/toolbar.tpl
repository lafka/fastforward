	{def $node_id   = first_set($module_result.node_id, 2)
	     $user      = fetch('user', 'current_user')
	     $user_hash = concat( $user.role_id_list|implode( '_' ), '_', $user.limited_assignment_value_list|implode( '_' ) )
	}
	{def $current_node     = fetch( 'content', 'node', hash('node_id', $node_id))
	     $content_object   = $current_node.object
	     $is_container     = $content_object.content_class.is_container
	     $can_set_location = fetch( 'content', 'access', hash( 'access', 'manage_locations',
	                                                           'contentobject', $current_node ) )
	     $policies         = fetch( 'user', 'user_role', hash( 'user_id', $user.contentobject_id ) )
	     $class_name       = first_set($content_object.class_name|downcase(), 'object')}

 	{cache-block keys=array( $module_result.uri, $user_hash )}
		{if $user.is_logged_in}
			<div class="toolbar navbar navbar-fixed-top">
				<div class="navbar-inner">
					<div class="container">
						<nav>
							{if and(is_set($content_object.can_edit), $content_object.can_edit)}
									<form method="post" action={"content/action"|ezurl}>
										<input type="hidden" name="ClassID" value="{$classdef.id}" />
  										<input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
										<input type="hidden" name="HasMainAssignment" value="1" />
										<input type="hidden" name="ContentObjectID" value="{$content_object.id}" />
										<input type="hidden" name="NodeID" value="{$current_node.node_id}" />
										<input type="hidden" name="ContentNodeID" value="{$current_node.node_id}" />
										<button class="btn btn-inverse" name="EditButton">
											<i class="icon-pencil icon-white"></i> Edit {$class_name}
										</button>
									</form>
							{/if}
							{if and($content_object.can_create, $is_container)}
								{def $class_list = $content_object.can_create_class_list}
								{if $class_list|count()|gt(1)}
									<span class="dropdown">

										<a data-toggle="dropdown" class="btn btn-inverse"> 
											<i class="icon-plus icon-white"></i>Create new child
											<span class="caret" />
										</a>
										<ul class="dropdown-menu">
											{foreach $class_list as $classdef}
												<li>
													<form method="post" action={"content/action"|ezurl}>
														<input type="hidden" name="ClassID" value="{$classdef.id}" />
  														<input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
														<input type="hidden" name="HasMainAssignment" value="1" />
														<input type="hidden" name="ContentObjectID" value="{$content_object.id}" />
														<input type="hidden" name="NodeID" value="{$current_node.node_id}" />
														<input type="hidden" name="ContentNodeID" value="{$current_node.node_id}" />
														<input type="submit" name="NewButton" title="Create object" value="Create new {$classdef.name|downcase()}" />
													</form>
												</li>
											{/foreach}
										</ul>
									</span>
								{elseif $class_list|count()}
									<form method="post" action={"content/action"|ezurl}>
										<input type="hidden" name="ClassID" value="{$classdef.id}" />
  										<input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
										<input type="hidden" name="HasMainAssignment" value="1" />
										<input type="hidden" name="ContentObjectID" value="{$content_object.id}" />
										<input type="hidden" name="NodeID" value="{$current_node.node_id}" />
										<input type="hidden" name="ContentNodeID" value="{$current_node.node_id}" />
										<button class="btn btn-inverse" name="NewButton">
											<i class="icon-pencil icon-white"></i> Create new {$class_list.0.name|downcase()}
										</button>
									</form>
								{/if}
							{/if}
							{if and(is_set($content_object.can_move), $content_object.can_move)}
								<form method="post" action={"content/action"|ezurl}>
									<input type="hidden" name="ClassID" value="{$classdef.id}" />
  									<input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
									<input type="hidden" name="HasMainAssignment" value="1" />
									<input type="hidden" name="ContentObjectID" value="{$content_object.id}" />
									<input type="hidden" name="NodeID" value="{$current_node.node_id}" />
									<input type="hidden" name="ContentNodeID" value="{$current_node.node_id}" />
									<button class="btn btn-inverse" name="MoveNodeButton">
										<i class="icon-move icon-white"></i> Move {$class_name} 
									</button>
								</form>
							{/if}
							{if and( $can_set_location,
							         ne( $current_node.node_id, ezini( 'NodeSettings', 'RootNode','content.ini' ) ), 
							         ne( $current_node.node_id, ezini( 'NodeSettings', 'MediaRootNode', 'content.ini' ) ),
							         ne( $current_node.node_id, ezini( 'NodeSettings', 'UserRootNode', 'content.ini' ) ) )}
								<form method="post" action={"content/action"|ezurl}>
									<input type="hidden" name="ClassID" value="{$classdef.id}" />
  									<input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
									<input type="hidden" name="HasMainAssignment" value="1" />
									<input type="hidden" name="ContentObjectID" value="{$content_object.id}" />
									<input type="hidden" name="NodeID" value="{$current_node.node_id}" />
									<input type="hidden" name="ContentNodeID" value="{$current_node.node_id}" />
									<button class="btn btn-inverse" name="AddAssignmentButton">
										<i class="icon-share icon-white"></i> Add new location
									</button>
								</form>
							{/if}
							{if and(is_set($content_object.can_remove), $content_object.can_remove)}
								<form method="post" action={"content/action"|ezurl}>
									<input type="hidden" name="ClassID" value="{$classdef.id}" />
  									<input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
									<input type="hidden" name="HasMainAssignment" value="1" />
									<input type="hidden" name="ContentObjectID" value="{$content_object.id}" />
									<input type="hidden" name="NodeID" value="{$current_node.node_id}" />
									<input type="hidden" name="ContentNodeID" value="{$current_node.node_id}" />
									<button class="btn btn-inverse" name="ActionRemove">
										<i class="icon-remove icon-white"></i> Remove {$class_name} 
									</button>
								</form>
							{/if}
							<ul class="nav pull-right">
								<li class="navbar-text"><i>Welcome, {$user.contentobject.name}</i></li>
								<li class="divider-vertical"></li>
								<li><a href={"user/logout"|ezurl()}>Logout</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		{/if}
	{/cache-block}
	{undef $user $user_hash}

