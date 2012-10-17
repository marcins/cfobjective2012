<ul>
<cfloop query="#rc.qPeople#">
    <cfoutput><li><a href="/routes/index.cfm/people/#rc.qPeople.id#">#rc.qPeople.name#</a></li></cfoutput>
</cfloop>
</ul>
<p><a href="/routes/index.cfm/people/new">Add New</a></p>