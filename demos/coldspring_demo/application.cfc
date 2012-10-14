component  extends="framework" output="false"
{
    this.name = "ColdspringDemo";
    this.mappings["/coldspring"] = expandPath("../coldspring");
    
    variables.framework = {
        reloadApplicationOnEveryRequest: true
    };
    
    public void function setupApplication ()
    {        
        var beanFactory = new coldspring.beans.DefaultXmlBeanFactory().init();
        beanFactory.loadBeans("coldspring.xml");
        setBeanFactory(beanFactory);
    }
    
}