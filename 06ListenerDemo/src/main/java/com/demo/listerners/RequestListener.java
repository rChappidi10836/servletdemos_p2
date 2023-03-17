package com.demo.listerners;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class RequestListener
 *
 */
@WebListener
public class RequestListener implements ServletRequestListener {

    
    public RequestListener() {
  
    }

	
    public void requestDestroyed(ServletRequestEvent sre)  { 
         System.out.println("Request destroyed...");
    }

	
    public void requestInitialized(ServletRequestEvent sre)  { 
         System.out.println("Request received...");
    }
	
}
