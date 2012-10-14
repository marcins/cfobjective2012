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
        var beanFactory = new coldspring.beans.DefaultXmlBeanFactory().init();
        beanFactory.loadBeans("coldspring.xml");
        setBeanFactory(beanFactory);
		
		
		/* 
		DI/1
	    var beanFactory = new ioc("./model");
	    beanFactory.addAlias("personDAO", "personStaticDAO");
	    //beanFactory.addAlias("personDAO", "personSQLDAO");
	    setBeanFactory(beanFactory);
        */
    }
    
}