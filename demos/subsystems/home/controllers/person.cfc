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
        rc.qPerson = getPersonService().getPersonById(rc.id);       
    }

}