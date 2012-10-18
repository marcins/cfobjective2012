<cfparam name="rc.name" type="string" default="" />
<cfparam name="rc.error" type="string" default="" />
<cfif rc.error NEQ "">
	<cfoutput><p>#rc.error#</p></cfoutput>
</cfif>
<cfinclude template="_editform.cfm">