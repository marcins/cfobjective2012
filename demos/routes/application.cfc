component  extends="framework" output="false"
{
    this.name = "RoutesDemo";
    this.datasource = "cfobjective";
    
    variables.framework = {
        reloadApplicationOnEveryRequest: true,
        defaultSection: "person",
        defaultItem: "list",
        routes: [
            {"/person/$" = "/person/list"},
            {"/person/(\d+)(\.(\w+))?/$" = "/person/show/id/\1/contentType/\3"}
        ]
            
        
    };
    
    public void function setupApplication ()
    {        
        var beanFactory = new ioc("./model");
        setBeanFactory(beanFactory);
    }
    
}