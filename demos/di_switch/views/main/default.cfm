<ul>
<cfloop query="#rc.qPeople#">
    <cfoutput><li>#rc.qPeople.name# (ID: #rc.qPeople.id#)</li></cfoutput>
</cfloop>
</ul>
<hr>
<p>Config string: <cfoutput>#rc.configString#</cfoutput></p>