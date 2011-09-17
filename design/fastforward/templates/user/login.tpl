<form method="post" action={"/user/login/"|ezurl}>

    <div class="login">
        <h2>{"Login"|i18n("design/standard/user")}</h2>

    {if $User:warning.bad_login}
        <div class="error">
            <h2>{"Could not login"|i18n("design/standard/user")}</h2>
            <p>
                {"A valid username and password is required to login."|i18n("design/standard/user")}
            </p>
        </div>
    {else}
        {if $site_access.allowed|not}
            <div class="error">
                <h2>{"Access not allowed"|i18n("design/standard/user")}</h2>
                <p>
                    {"You are not allowed to access %1."|i18n("design/standard/user",,array($site_access.name))}
                </p>
            </div>
        {/if}
    {/if}

        <div class="element">
            <label for="username">{"Username"|i18n("design/standard/user",'User name')}</label>
            <input type="text" size="10" name="Login" id="username" value="{$User:login|wash}" tabindex="1" />
        </div>
        <div class="element">
            <label for="password">{"Password"|i18n("design/standard/user")}</label>
            <input type="password" size="10" name="Password" id="password" value="" tabindex="2" />
        </div>
    {if ezini( 'SiteSettings', 'LoginPage' )|eq( 'custom' )}
        <p>
            <a href={'/user/forgotpassword'|ezurl}>{'Forgot your password?'|i18n( 'design/standard/user' )}</a>
        </p>
    {/if}

    {if and( ezini_hasvariable( 'Session', 'RememberMeTimeout' ), ezini( 'Session', 'RememberMeTimeout' ) )}
        <div class="element">
            <label for="remember-me" style="display:inline;">
                {"Remember me"|i18n("design/admin/user/login")}
                <input type="checkbox" tabindex="3" name="Cookie" id="remember-me" />
            </label>
        </div>
    {/if}
    <div class="group">
            <input class="main button" type="submit" name="LoginButton" value="{'Login'|i18n('design/standard/user','Button')}" tabindex="4" />
        </div>
        
        <input type="hidden" name="RedirectURI" value="{$User:redirect_uri|wash}" />

    {if and( is_set( $User:post_data ), is_array( $User:post_data ) )}
        {foreach $postData as $key => $item}
            <input name="Last_{$key}" value="{$item}" type="hidden" />
        {/foreach}
    {/if}
    </div>
</form>
