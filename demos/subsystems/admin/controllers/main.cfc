component  output="false" accessors="true"
{
    property name="personService";
    
    public void function default (required struct rc)
    {
        rc.qPeople = getPersonService().getPeople();
    }
}