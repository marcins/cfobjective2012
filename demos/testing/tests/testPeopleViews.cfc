component  extends="mxunit.framework.TestCase" output="false"
{
	public void function setUp ()
	{
		
	}
	
	private string function buildUrl ()
	{
		return "";
	}
	
	private string function getTemplateOutput (required string filename, required any rc)
	{
		var body = "";
		savecontent variable="output" {
			include filename;
		}
		return output;	
	}
	
	public void function testDefaultLayout (void)
	{
		var rc = { isLoggedIn: false};
		var output = getTemplateOutput("../layouts/default.cfm", rc);
		assertTrue(output contains "Login", "Should contain login link when not logged in");
		rc.isLoggedIn = true;
		output = getTemplateOutput("../layouts/default.cfm", rc);
		assertTrue(output contains "Logout", "Should contain logout link when logged in");
	}
	
	public void function testPersonList (void)
	{
		var rc = {
			qPeople: queryNew("id,name", "integer,varchar", [
				{id: 1, name: "Test 1"},
				{id: 2, name: "Test 2"}
			])
		};
		var output = getTemplateOutput("../views/people/list.cfm", rc);
		// TODO add JSoup test here
	}
	
	public void function testEditForm (void)
	{
		var rc = {
			person: {
				id: 1,
				name: "Test"
			},
			edit: true
		};
		var output = getTemplateOutput("../views/people/show.cfm", rc);
		// TODO check form action is correct
		
		
		rc = {
			person: {
				id: 0
			},
			edit: true
		};
		
		output = getTemplateOutput(getTemplateOutput("../layouts/default.cfm", rc);
		// TODO check form action again
		
	}
}