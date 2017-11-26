package royal.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import royal.context.competecache.competecache;

@WebListener
public class Appcontextlistner implements ServletContextListener  {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext ctx = servletContextEvent.getServletContext();
        competecache c = new competecache();
        ctx.setAttribute("context_cache_cr", c);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
