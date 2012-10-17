component  output="false" accessors="true"
{
    property name="personService";
    
    public any function init (required any fw)
    {
        variables.fw = arguments.fw;
        return this;
    }
    
    public void function list (required any rc)
    {
       rc.qPeople = getPersonService().getPeople();
    }
    
    public void function show (required any rc)
    {
        if (rc.contentType == "")
        {
            rc.contentType = "html";
        }
        
        var qPerson = getPersonService().getPersonById(rc.id);       
        
        rc.person = {
        	id: qPerson.id,
        	name: qPerson.name
        };
		
        switch (rc.contentType)
        {
            case "html":
            break;
            
            case "jpg":
            location("/routes/photos/#rc.id#.jpg", false, 301);
            abort;
            break;
            
            case "json":
            rc.json = serializeJSON({
                id: rc.qPerson.id,
                name: rc.qPerson.name
            });
            variables.fw.setView("rest.json");
            break;
        }
    }
    
	public void function new (required any rc)
	{
		rc.person = {
			id: 0,
			name: ""
		};
	}
	
    public void function create (required any rc)
    {
    	param name="rc.name" type="string" default="";    	
    	if (rc.name == "")
    	{
    		rc.error = "You must enter a name";
    		variables.fw.redirect(action="people.new", preserve="error");
    	}
    	else
    	{
    		getPersonService().createPerson(rc.name);
    		variables.fw.redirect(action="people");
    	}
		
    }

}