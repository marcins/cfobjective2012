<cfif rc.person.id EQ 0>
<form action="/routes/index.cfm/people" method="POST">
<cfelse>
<form action="/routes/index.cfm/people" method="PUT">
</cfif>	
	<fieldset>
		<label for="name">Name</label>
		<input name="name" id="name" value="<cfoutput>#rc.person.name#</cfoutput>" />
		<input type="hidden" name="id" value="<cfoutput>#rc.person.id#</cfoutput>" />
		<input type="submit" value="Save" />
	</fieldset>
</form>