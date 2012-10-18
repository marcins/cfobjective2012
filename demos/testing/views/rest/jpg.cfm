<cfheader name="Content-length" value="#arrayLen(rc.image)#">
<cfcontent variable="#rc.image#" type="image/jpg">
<cfset request.layout = false>