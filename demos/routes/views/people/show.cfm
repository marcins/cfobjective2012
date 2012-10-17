<cfparam name="rc.edit" type="boolean" default="false">

<cfif rc.edit>
<cfinclude template="_editform.cfm" />
<cfelse>
<cfoutput>
<p><strong>Name:</strong> #rc.qPerson.name#</p>
<img src="/routes/index.cfm/people/#rc.qPerson.id#.jpg" />
</cfoutput>
</cfif>
<p><a href="/routes/index.cfm/people/">Back to list</a></p>