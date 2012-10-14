component  extends="framework" output="false"
{
    this.name = "DIDemo";
    this.mappings["/coldspring"] = expandPath("../coldspring/");
    
    this.datasource = "cfobjective";
    
    variables.framework = {
        reloadApplicationOnEveryRequest: true
    };
    
    public void function setupApplication ()
    {        
        /*
        COLDSPRING
        */
        var props = {
            configString: "Coldspring Property Config String"
        };
        
        var beanFactory = new coldspring.beans.DefaultXmlBeanFactory().init(defaultProperties=props);
        beanFactory.loadBeans("coldspring.xml");
        setBeanFactory(beanFactory);
		
		
		/* 
		DI/1
	    var beanFactory = new ioc("./model", {
	        constants: {
	            configString: "DI/1 Config String"
	        }
	    });
	    
	    beanFactory.addAlias("personDAO", "personStaticDAO");
	    //beanFactory.addAlias("personDAO", "personSQLDAO");
	    setBeanFactory(beanFactory);
        */
    }
    
}