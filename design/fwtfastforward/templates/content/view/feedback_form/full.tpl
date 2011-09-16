{* Feedback form - Full view *}
<div class="content-view-full">
    <div class="class-feedback-form">

        <h1>{$node.name|wash()}</h1>

        <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.description}
        </div>

        {include name=Validation uri='design:content/collectedinfo_validation.tpl'
                 class='error'
                 validation=$validation collection_attributes=$collection_attributes}
				 
        <form method="post" action={"content/action"|ezurl}>		
		
        {* Email address (information collector). *}
        <div class="attribute-email">
            <label>{'Your email address'|i18n( 'design/admin/preview/feedbackform' )}:</label>
            {attribute_view_gui attribute=$node.data_map.email}
        </div>

        {* Sender name (information collector). *}
        {if is_set( $node.data_map.sender_name )}
            <div class="attribute-email">
                <label>{'Your name'|i18n( 'design/admin/preview/feedbackform' )}:</label>
                {attribute_view_gui attribute=$node.data_map.sender_name}
            </div>
        {/if}

        {* Subject (information collector). *}
        <div class="attribute-subject">
            <label>{'Subject'|i18n( 'design/admin/preview/feedbackform' )}:</label>
            {attribute_view_gui attribute=$node.data_map.subject}
        </div>

        {* Message (information collector). *}
        <div class="attribute-message">
            <label>{'Message'|i18n( 'design/admin/preview/feedbackform' )}:</label>
            {attribute_view_gui attribute=$node.data_map.message}
        </div>


        <div class="content-action">
            <input type="submit" class="defaultbutton" name="ActionCollectInformation" value="{"Send form"|i18n("design/base")}" />
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
            <input type="hidden" name="ViewMode" value="full" />
        </div>
        </form>

    </div>
</div>
