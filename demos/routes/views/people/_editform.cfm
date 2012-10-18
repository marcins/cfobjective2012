<cfif rc.person.id EQ  0> 
<cfset action = "/routes/index.cfm/people">
<cfelse>
<cfset action = "/routes/index.cfm/people/#rc.person.id#">
</cfif>
<cfoutput>
<form action="#action#" method="POST">
	<fieldset>
		<label for="name">Name</label>
		<input name="name" id="name" value="#rc.person.name#" />
		<input type="hidden" name="id" value="#rc.person.id#" />
		<cfif rc.person.id NEQ 0>
			<input type="hidden" name="_method" value="PUT" />
		</cfif>
		<input type="submit" value="Save" />
	</fieldset>
</form>
</cfoutput>