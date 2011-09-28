<section id="login" class="user{if $site_access.allowed|not()} error{/if} has-aside">
{def $loginpage = fetch( 'content', 'node', hash( 'node_path', 'page/user/login' ) )}
	<aside id="login-form">
		<form method="post" action={"/user/login"|ezurl()}>
			{if $User:login|eq( '' )}
				{set name=User $login = ezini( 'Forms', 'Username', 'fastforward.ini' )}
			{/if}
			<label for="username" class="username">{"Username"|i18n("design/standard/user",'User name')}</label>
			<input type="text" name="Login" id="username" value="{$User:login|wash()}" tabindex="1" />
			
			<label for="password" class="password">{"Password"|i18n("design/standard/user", 'Password')}</label>
			<input type="password" name="Password" id="password" value="{ezini( 'Forms', 'Password', 'fastforward.ini' )}" tabindex="2" />
			<p id="forgot-password" class="small"><a href={'/user/forgotpassword'|ezurl}>{'Forgot your password?'|i18n( 'design/standard/user' )}</a></p>
			
			{if and( ezini_hasvariable( 'Session', 'RememberMeTimeout' ), ezini( 'Session', 'RememberMeTimeout' ) )}
				<label for="remember-me">{"Remember me"|i18n("design/admin/user/login")}</label>
				<input type="checkbox" tabindex="3" name="Cookie" id="remember-me" />
			{/if}
			
			<input type="hidden" name="RedirectURI" value="{$User:redirect_uri|wash()}" />
			<input class="default" type="submit" name="LoginButton" value="{'Login'|i18n('design/standard/user')}" tabindex="4"/>
			<input type="submit" name="RegisterButton" value="{'Register'|i18n('design/standard/user')}" tabindex="5" />
		</form>
	</aside>

{if and( $loginpage|is_object(), $loginpage.data_map.body.has_content)}
	<article class="content">
		<hgroup>
			<h1>{attribute_view_gui attribute=$loginpage.data_map.name}</h1>
		</hgroup>
		{attribute_view_gui attribute=$loginpage.data_map.body}
	</article>
{/if}
</section>