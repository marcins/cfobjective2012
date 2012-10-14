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
        
        rc.qPerson = getPersonService().getPersonById(rc.id);       
        
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

}