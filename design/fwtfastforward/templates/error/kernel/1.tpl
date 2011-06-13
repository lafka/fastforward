
<div class="message">
<h2>{"Access denied"|i18n("design/standard/error/kernel")}</h2>
<div class="error">
<p>{"You do not have permission to access this area."|i18n("design/standard/error/kernel")}</p>
<b>{"Possible reasons for this are"|i18n("design/standard/error/kernel")}:</b>
<p>
    {if ne($current_user.contentobject_id,$anonymous_user_id)}
        {"Your current user does not have the proper privileges to access this page."|i18n("design/standard/error/kernel")}<br />
    {else}
        {"You are currently not logged in to the site, to get proper access create a new user or login with an existing user."|i18n("design/standard/error/kernel")}<br />
    {/if}
    {"You misspelled some parts of your URL, try changing it."|i18n("design/standard/error/kernel")}<br />
</p>
{if is_set($module_required)}
<h4>{"Permission required"|i18n("design/standard/error/kernel")}</h4>
<p>
{"Module : "|i18n("design/standard/error/kernel")}{$module_required}<br />
{"Function : "|i18n("design/standard/error/kernel")}{$function_required}<br />

{/if}
</div>
</div>
