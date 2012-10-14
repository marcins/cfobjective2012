component  output="false" accessors="true"
{
    property name="personDAO";
    
    public any function init (required string configString)
    {
        variables.configString = arguments.configString;
    }
    
    public query function getPeople ()
    {
        var qry = getPersonDAO().getPeople();
        return qry;
    }
    
    public string function getConfigString ()
    {
        return variables.configString;
    }
}