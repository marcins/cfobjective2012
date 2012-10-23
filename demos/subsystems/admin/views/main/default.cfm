<p>This is the admin page</p>
<h2>Delete People</h2>
<cfloop query="#rc.qPeople#">
    <cfoutput><li><a href="#buildUrl(action="main.delete", queryString="id=#rc.qPeople.id#")#">Delete <cfoutput>#rc.qPeople.name#</cfoutput></a></li></cfoutput>
</cfloop>