component  output="true"
{
	public any function init ()
	{
		writeLog(text="personStatic init");
		return this;
	}
    public query function getPeople ()
    {
	    var qry = queryNew("id,name", "integer,varchar", 
	            [{id: 1, name: "Person One"}, {id: 2, name: "Person Two"}]
	        );
        return qry;
    }

}