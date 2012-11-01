component  extends="mxunit.framework.TestCase" output="false"
{
	public void function setUp ()
	{
		
	}
		
	public void function testDefaultLayout (void)
	{
		var rc = { isLoggedIn: false };
		var output = getTemplateOutput("../layouts/default.cfm", rc);
		assertTrue(output contains "Login", "Should contain login link when not logged in");
		rc.isLoggedIn = true;
		output = getTemplateOutput("../layouts/default.cfm", rc);
		assertTrue(output contains "Logout", "Should contain logout link when logged in");
		assertTrue(output contains "!BODY!", "Should render body");
	}
	
	public void function testPersonList (void)
	{
		var rc = {
			qPeople: queryNew("id,name", "integer,varchar", [
				{id: 1, name: "Test 1"},
				{id: 2, name: "Test 2"}
			])
		};
		var soup = getTemplateOutput("../views/people/list.cfm", rc, true);
		var listItems = soup.select("ul li");
		assertEquals(2, arrayLen(listItems)); // ensure both people rendered
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

		var soup = getTemplateOutput("../views/people/show.cfm", rc, true);
		var elems = soup.select("form");
		assertEquals(1, arrayLen(elems));
		var elemForm = elems[1];
		assertEquals("post", elemForm.attr("method"), "Form method should be POST");
		
		elems = soup.select("input[name=_method]");
		assertEquals(1, arrayLen(elems));
		assertEquals("PUT", elems[1].attr("value"));		
		
		rc = {
			edit: true
		};
		
		soup = getTemplateOutput("../views/people/show.cfm", rc, true);
		elems = soup.select("input[name=_method]");
		assertEquals(0, arrayLen(elems));		
	}
	
	public void function testValidationError (void)
	{
		var rc = {
			error: "You must enter a name",
			person: {
				id: 0,
				name: ""
			},
			edit: true
		};
		var soup = getTemplateOutput("../views/people/show.cfm", rc, true);
		var elems = soup.select("p.error");
		assertEquals(1, arrayLen(elems), "Expected a p.error element");
		assertEquals(rc.error, elems[1].text());
	}
			
	private string function buildUrl ()
	{
		return "";
	}
	
	private string function getTemplateOutput (required string filename, required any rc, boolean returnSoup = false)
	{
		var body = "!BODY!";
		savecontent variable="output" {
			include filename;
		}
		
		if (returnSoup)
		{
			return getSoup(output);
		}
		else
		{
			return output;
		}
	}
	
	private any function getSoup(required string html)
	{
		var JSoup = createObject("java", "org.jsoup.Jsoup");
		var soup = JSoup.parse(html);
		return soup;
	}


}