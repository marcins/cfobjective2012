<!DOCTYPE html>
<html>
    <head>
        <title><cfoutput><cfif structKeyExists(rc, "pageTitle")>#rc.pageTitle#<cfelse>FW/1 Testing</cfif></cfoutput></title>
    </head>
	<h1>Testing</h1>
	<nav>
		<ul>
			<cfparam name="rc.isLoggedIn" default="false">
			<cfoutput>
			<cfif rc.isLoggedIn>				
			<li><a href="#buildUrl("default.logout")#">Logout</a></li>
			<cfelse>
			<li><a href="#buildUrl("default.login")#">Login</a></li>
			</cfif>
			</cfoutput>
		</ul>
	</nav>
    <body><cfoutput>#body#</cfoutput></body>	
</html>
