{let version=fetch( content, version, hash( object_id, $object_id,
                                            version_id, $object_version ) )}
<form action={"content/removeeditversion"|ezurl} method="post" name="EditVersionRemove">
	<div class="alert">
		<p>
			<b>{"Confirmation required"|i18n('content/misc/action')}</b>
		</p>
		<p>
			{"Are you sure you want to discard the draft %versionname?"
			 |i18n( 'design/standard/content/edit', , hash( '%versionname', concat( '<em><b>', $version.version_name|wash, '</b></em>' ) ) )}
		</p>

		<div class="control-group">
			<input type="submit" class="btn btn-danger" name="ConfirmButton" value="{"Confirm"|i18n("design/standard/content/edit")}" />
			<input class="btn" type="submit" name="CancelButton" value="{"Cancel"|i18n("design/standard/content/edit")}" />
		</div>
	</div>

</form>
