{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<h1>{$object.name|wash}</h1>

<table>
<tr>
    <td width="80%" valign="top">

    <table width="100%">
    {section name=ContentObjectAttribute loop=$object.contentobject_attributes}

    <tr>
	<td>
	<i>{$ContentObjectAttribute:item.contentclass_attribute.name|wash}</i>
	</td>
    </tr>
    <tr><td>

    <table cellspacing="0" cellpadding="0"><tr><td>  </td><td>
    {attribute_view_gui attribute=$ContentObjectAttribute:item}</td></tr></table>
    
    </td></tr>
    {/section}

    </table>

    </td>
    <td width="20%" valign="top">
    {let related=$object.related_contentobject_array}
      {section show=$related}
        <h3>{"Related objects"|i18n("design/standard/content/view")}</h3>
        <table width="100%" cellspacing="0">
        {section name=Object loop=$related sequence=array(bglight,bgdark)}
        <tr>
    	  <td class="{$Object:sequence}">
            {content_view_gui view=line content_object=$Object:item}
    	  </td>
        </tr>
        {section-else}
        <tr>
            <td class="{$Object:sequence}">
            {"None"|i18n("design/standard/content/view")}
            </td>
        </tr>
        {/section}
        </table>
      {/section}
    {/let}
    </td>
</tr>
</table>
