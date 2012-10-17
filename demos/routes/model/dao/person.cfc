component  output="false"
{
    public query function getPeople ()
    {
        var queryService = new query();
        queryService.setSQL("SELECT id, name FROM people");
        var result = queryService.execute();
        return result.getResult();
    }
    
    public query function getPersonById (required numeric id)
    {
        var queryService = new query();
        queryService.setSQL("SELECT id, name FROM people WHERE id = :id");
        queryService.addParam(name="id", value=arguments.id, cfsqltype="cf_sql_integer");
        var result = queryService.execute();
        return result.getResult();
    }
    
    public void function createPerson (required string name)
    {
        var queryService = new query();
        queryService.setSQL("INSERT INTO people (name) VALUES (:name)");
        queryService.addParam(name="name", value=arguments.name, cfsqltype="cf_sql_varchar");
        var result = queryService.execute();
    }
}