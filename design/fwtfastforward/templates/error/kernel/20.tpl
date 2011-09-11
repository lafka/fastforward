<div class="message">
<h2>{"Module not found"|i18n("design/standard/error/kernel")}</h2>
<div class="error">
<p>{"The requested view %view could not be found in module %module"|i18n("design/standard/error/kernel",,
                                                                         hash('%view',$parameters.view|wash,
                                                                              '%module',$parameters.module|wash))}</p>
<p>{"The requested module %module could not be found."|i18n("design/standard/error/kernel",,
                                                            hash('%module',$parameters.module|wash))}</p>
<b>{"Possible reasons for this are"|i18n("design/standard/error/kernel")}:</b>
<ul>
    <li>{"The module name was misspelled, try changing the URL."|i18n("design/standard/error/kernel")}</li>
    <li>{"The module does not exist on this site."|i18n("design/standard/error/kernel")}</li>
    <li>{"This site uses siteaccess matching in the URL and you did not supply one, try inserting a siteaccess name before the module in the URL ."|i18n("design/standard/error/kernel")}</li>
</ul>
</div>
</div>
