component  output="false" accessors="true"
{
    property name="personDAO";
    
    public query function getPeople ()
    {
        var qry = getPersonDAO().getPeople();
        return qry;
    }
    
    public query function getPersonById (required numeric id)
    {
        var qry = getPersonDAO().getPersonById(id);
        return qry;
    }
    
    public void function createPerson (required string name)
    {
    	getPersonDAO().createPerson(name);
    }
    
    public void function updatePerson (required numeric id, required string name)
    {
    	getPersonDAO().updatePerson(id, name);
    }
}