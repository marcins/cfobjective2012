component  output="false"
{
    public query function getPeople ()
    {
        var queryService = new query();
        queryService.setSQL("SELECT id, name FROM people");
        var result = queryService.execute();
        return result.getResult();
    }
}