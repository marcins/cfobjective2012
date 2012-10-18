<cfparam name="rc.edit" type="boolean" default="false">

<cfif rc.edit>
<cfinclude template="_editform.cfm" />
<cfelse>
<cfoutput>
<p><strong>Name:</strong> #rc.person.name#</p>
<img src="/routes/index.cfm/people/#rc.person.id#.jpg" />
</cfoutput>
</cfif>
<p><a href="/routes/index.cfm/people/<cfoutput>#rc.person.id#</cfoutput>?edit=true">Edit</a> | <a href="/routes/index.cfm/people/">Back to list</a></p>