<p>This is the admin page</p>
<h2>Person List</h2>
<cfloop query="#rc.qPeople#">
    <li><cfoutput>#rc.qPeople.name#</cfoutput></li>
</cfloop>