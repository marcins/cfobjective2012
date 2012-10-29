component  extends="framework" output="false"
{
    this.name = "SubsystemsDemo";
    this.datasource = "cfobjective";
    
    variables.framework = {
        usingSubSystems: true,
        reloadApplicationOnEveryRequest: true
    };
    
    public void function setupSubSystem (required string subsystem)
    {
        writeLog(text="Setup Sub-System: #subsystem#");
        if (directoryExists(expandPath(subsystem & "/model")))
        {
            writeLog(text="Adding bean factory for #subsystem#");
	        var subSystemBeanFactory = new ioc(subsystem & "/model");
	        subSystemBeanFactory.setParent(getDefaultBeanFactory());
	        setSubsystemBeanFactory(subsystem, subSystemBeanFactory);
	        
	        if (subsystem == "admin")
	        {
	        	subSystemBeanFactory.addAlias("personDAO", "personStaticDAO");
	        }
        }
        else
        {
        	writeLog(text="#expandPath(subsystem & "/model")# doesn't exist");
        }
    }
    
    public void function setupApplication ()
    {        
        var beanFactory = new ioc("./common/model");
        setBeanFactory(beanFactory);
    }    
}
    
