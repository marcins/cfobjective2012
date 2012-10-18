<cfset getPageContext().getResponse().setContentType("application/json")>
<cfoutput>#rc.json#</cfoutput>
<cfset request.layout = false>