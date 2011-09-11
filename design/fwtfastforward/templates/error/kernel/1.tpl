
<div class="message">
<h2>{"Access denied"|i18n("design/standard/error/kernel")}</h2>
<div class="error">
    <p>{"You do not have permission to access this area."|i18n("design/standard/error/kernel")}</p>
    <b>{"Possible reasons for this are"|i18n("design/standard/error/kernel")}:</b>
    <ul>
        {if ne($current_user.contentobject_id,$anonymous_user_id)}
            <li>{"Your current user does not have the proper privileges to access this page."|i18n("design/standard/error/kernel")}</li>
        {else}
            <li>{"You are currently not logged in to the site, to get proper access create a new user or login with an existing user."|i18n("design/standard/error/kernel")}</li>
        {/if}
        <li>{"You misspelled some parts of your URL, try changing it."|i18n("design/standard/error/kernel")}</li>
    </ul>
</div>
</div>
