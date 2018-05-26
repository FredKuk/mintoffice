package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Application Lifecycle Listener implementation class ContextLoaderListener
 *
 */
public class ContextLoaderListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ContextLoaderListener() {
        System.out.println("MintOffice:ContextLoaderListener()호출됨");
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
    	System.out.println("MintOffice:ContextLoaderListener의 contextInitialized()호출됨");
    }
    
	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
        System.out.println("Mintoffice:ContextLoaderListener contextDestroyed()호출됨");
    }
	
}
