<ul>
<cfloop query="#rc.qPeople#">
    <cfoutput><li><a href="/routes/index.cfm/people/#rc.qPeople.id#">#rc.qPeople.name#</a></li></cfoutput>
</cfloop>
</ul>
<p><a href="/routes/index.cfm/people/new">Add New</a></p>
<!---<p>
<cfoutput>#buildUrl(action="people.show")#<br>
#buildUrl(action="main")#<br>
#buildUrl(action=".foo", queryString="id=1")#
#buildUrl(action="section.item", queryString="id=1&debug=true")#
</cfoutput>
</p>--->