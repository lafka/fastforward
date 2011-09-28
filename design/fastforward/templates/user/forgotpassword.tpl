{if $link}
	<section id="forgotpassword" class="user has-aside">
		<p class="notice">
		{"A mail has been sent to the following email address: %1. This email contains a link you need to click so that we can confirm that the correct user is getting the new password."|i18n('design/standard/user/forgotpassword',,array($email))}
		</p>
	</section>
{else}
	<section id="forgotpassword" class="user has-aside">
	{def $forgotpassword = fetch( 'content', 'node', hash( 'node_path', 'page/user/forgot-password' ) )}

		<aside id="login-form">
			<form method="post" name="forgotpassword" action={"/user/forgotpassword/"|ezurl}>

				<label for="email-address">{"Email"|i18n('design/standard/user/forgotpassword')}</label>
				<input type="text" name="UserEmail" id="email-address" value="{cond( $wrong_email|ne(''), $wrong_email|wash, true(), ezini( 'Forms', 'ExampleEmail', 'fastforward.ini' ))}" />
				<input class="default" type="submit" name="GenerateButton" value="{'Generate new password'|i18n('design/standard/user/forgotpassword')}" tabindex="2"/>
			</form>
		</aside>

	{if and( $forgotpassword|is_object(), $forgotpassword.data_map.body.has_content)}
		<article class="content">
			<hgroup>
				<h1>{attribute_view_gui attribute=$forgotpassword.data_map.name}</h1>
			</hgroup>

			{if $generated}
				<p class="success">
					{"Password was successfully generated and sent to: %1"|i18n('design/standard/user/forgotpassword',,array($email))}
				</p>
			{elseif or( $wrong_email, $wrong_key )}
				{if $wrong_email}
					<p class="error">{"There is no registered user with that email address."|i18n('design/standard/user/forgotpassword')}</p>
				{/if}
				{if $wrong_key}
					<p class="error">{"The key is invalid or has been used. "|i18n('design/standard/user/forgotpassword')}</p>
				{/if}
			{/if}

			{attribute_view_gui attribute=$forgotpassword.data_map.body}
		</article>
	{/if}
	</section>
