<h2>People</h2>
<ul>
<cfloop query="#rc.qPeople#">
    <cfoutput><li><a href="#buildUrl(action="person.show", queryString="id=#rc.qPeople.id#")#">#rc.qPeople.name#</a></li></cfoutput>
</cfloop>
</ul>