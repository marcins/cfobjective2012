component  extends="framework" output="false"
{
    this.name = "RoutesDemo";
    this.datasource = "cfobjective";
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0, 0, 10, 0);
    
    variables.framework = {
        reloadApplicationOnEveryRequest: true,
        defaultSection: "people",
        defaultItem: "list",
        routes: [
            {
            	"$GET/people$" = "/people/index", 
            	"$GET/people/new" = "/people/new", 
            	"$POST/people" = "/people/create", 
            	"$GET/people/(\d+)(\.(\w+))?/$" = "/people/show/id/\1/contentType/\3", 
            	"$GET/people/(\d+)/contacts(\.(\w+))?/$" = "/people/showContacts/person_id/\1/contentType/\3",
            	"$PUT/people/(\d+)?/$" = "/people/update/\1/", 
            	"$DELETE/people/:id" = "/people/destroy/:id/"
            }
        ]
    };
    
    public void function setupApplication ()
    {        
        var beanFactory = new ioc("./model");
        setBeanFactory(beanFactory);
    }
    
}