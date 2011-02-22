<div id="languages">
	<ul>
                {if and( is_set( $DesignKeys:used.url_alias ), $DesignKeys:used.url_alias|count|ge(1) )}
                    {def $avail_translation = language_switcher( $DesignKeys:used.url_alias )}
                {else}
                    {def $avail_translation = language_switcher( $site.uri.original_uri)}
                {/if}
                {def $flagurl = ''}
                {foreach $avail_translation as $siteaccess => $lang}
    {set $flagurl = "/images/flags/"|append( $lang.text|extract_left(2)|upcase() )|append('.png')}
    <li{if $siteaccess|eq($access_type.name)} class="active current_siteaccess"{/if}><a href={$lang.url|ezurl}><img src={$flagurl|ezdesign(no)} />{$lang.text|wash}</a></li>
                {/foreach}
                {undef $flagurl}
    </ul>
</div><!-- end: #languages -->