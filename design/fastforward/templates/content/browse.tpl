{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{let browse_indentation=5
     page_limit=15
     browse_list_count=fetch(content,list_count,hash(parent_node_id,$node_id,depth,1))
     bookmark_list=fetch('content','bookmarks',array())
     recent_list=fetch('content','recent',array())

     select_name='SelectedObjectIDArray'
     select_type='checkbox'
     select_attribute='contentobject_id'}

{if eq($browse.return_type,'NodeID')}
    {set select_name='SelectedNodeIDArray'}
    {set select_attribute='node_id'}
{/if}
{if eq($browse.selection,'single')}
    {set select_type='radio'}
{/if}

<form action={concat($browse.from_page)|ezurl} method="post">
	<h1>{"Browse"|i18n("design/standard/content/browse")} - {$main_node.name|wash}</h1>

	<p>
		Please choose objects which you want to relate to {$main_node.name|wash}
	</p>
	<p>
		Select your objects then click the select button.
	</p>

	{def $list = fetch('content', 'list', hash(parent_node_id, $node_id,
	                                           depth,          1,
	                                           offset,         $view_parameters.offset,
	                                           limit,          $page_limit,
	                                           sort_by,        $main_node.sort_array))}

	<ul>

	{foreach $list as $item}
		<li>
			<input type="{$select_type}"
			       name="{$select_name}[]"
			       value="{$item[$select_attribute]}"
			       {if $browse.class_array|contains($item.class_identifier)|not}
			       disabled
			       {/if}
			       />
			{if and($item.is_container, $item.children_count|gt(0))}
				<a href={concat( 'content/browse/', $item.node_id, '/')|ezurl()} title="{$item.name|wash()}">{$item.name|wash}</a>
			{else}
				{$item.name|wash()}
			{/if}

		</li>
	{/foreach}

	</ul>

	{include name=Navigator
         uri='design:navigator/google.tpl'
         page_uri=concat('/content/browse/',$main_node.node_id)
         item_count=$browse_list_count
         view_parameters=$view_parameters
         item_limit=$page_limit}

	{section name=Persistent show=$browse.persistent_data loop=$browse.persistent_data}
		<input type="hidden" name="{$:key|wash}" value="{$:item|wash}" />
	{/section}

	{if $browse.browse_custom_action}
		<input type="hidden" name="{$browse.browse_custom_action.name}" value="{$browse.browse_custom_action.value}" />
	{/if}

	<input type="hidden" name="BrowseActionName" value="{$browse.action_name}" />

	{if $cancel_action}
		<input type="hidden" name="BrowseCancelURI" value="{$cancel_action}" />
	{/if}

	<div class="form-actions">
		<input class="btn btn-primary" type="submit" name="SelectButton" value="{'Select'|i18n('design/standard/content/browse')}" />
		<input class="btn" type="submit" name="BrowseCancelButton" value="{'Cancel'|i18n( 'design/standard/content/browse' )}" />
	</div>
{/let}
