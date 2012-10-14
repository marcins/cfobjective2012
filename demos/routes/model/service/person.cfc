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
}