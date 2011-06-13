<div id="languages">
	<ul>
		{def $translations = language_switcher( $module_result.content_info.node_id)}
		{def $flagurl = ''}
        {foreach $translations as $siteaccess => $lang}
    {set $flagurl = "images/flags/"|append( $lang.text|extract_left(2)|downcase() )|append('.png')}
    <li{if $siteaccess|eq($access_type.name)} class="current siteaccess"{/if}><a href={$lang.url|ezurl}><img src={$flagurl|ezdesign()} />{$lang.text|wash}</a></li>
                {/foreach}
                {undef $flagurl}
    </ul>
</div><!-- end: #languages -->