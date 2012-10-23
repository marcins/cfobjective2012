component  extends="mxunit.framework.TestCase" output="false"
{
	public void function setUp ()
	{
		variables.fw = mock("testing.framework");
		variables.controller = new testing.controllers.people(variables.fw);
		var mockPersonService = mock("testing.model.service.person");
		var mockResults = queryNew("id,name","integer,varchar", [ {id: 1, name: "Test"}] );
		mockPersonService.getPeople().returns(mockResults);
		
		mockPersonService.getPersonById(1).returns(mockResults);
		
		variables.controller.setPersonService(mockPersonService);		
	}
	
	public void function testPersonList ()
	{
		var rc = {};
		variables.controller.list(rc);
		variables.controller.getPersonService().verifyTimes(1).getPeople();
		assertIsQuery(rc.qPeople); 
	}
	
	public void function testPersonValidate ()
	{
		var rc = {
			person: {
				id: 0	
			}
		};
		
		variables.fw.redirect("{string}", "{string}").returns();		
		variables.controller.create(rc);
		assertTrue(structKeyExists(rc, "error"), "Expected error in RC");
		assertTrue(Len(rc.error) GT 0, "Expected an error message" );
		variables.fw.verify(1).redirect("{string}", "{string}");		
	}
	
	public void function testPersonShow ()
	{
		var rc = { id: 1 };
		variables.fw.redirect("/testing/index.cfm/").returns();		
		variables.controller.show(rc);
		variables.fw.verify(0).redirect();
		assertIsStruct(rc.person);
		assertEquals(1, rc.person.id);
		assertEquals("Test", rc.person.name);
		
		rc = {id: 2, contentType: "html"};
		
		variables.controller.show(rc);
		variables.fw.verify(1).redirect("/testing/index.cfm/");
		
	}
	
}