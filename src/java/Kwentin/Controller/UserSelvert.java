/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
package Kwentin.Controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Kwentin.Email.*;
import Kwentin.Model.User;
import javax.mail.MessagingException;
/**
 * the program of this application is 
 * @author Kasman98
 */
public class UserSelvert extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        // get parameters from the request
        String firstName = request.getParameter("firstName");
      
        String email = request.getParameter("email");
        
        

        // store data in User object
        User user = new User();
        user.setFirstName(firstName);
        user.setEmail(email);
   
        request.setAttribute("user", user);
        String to = email;
            String from = "mr.kasman2@gmail.com";
            String subject = "Welcome to our email list";
            String body = "Dear " + firstName + " "+",\n\n" +
                "Thanks for joining our email list. We'll make sure to send " +
                "you announcements about new products and promotions.\n" +
                "Have a great day and thanks again!\n\n" +
                "Kwentin Shelton\n" +
                "Copyright 2019";
            boolean isBodyHTML = false;

            try
            {
                Email.sendMail(to, from, subject, body, isBodyHTML);
            }
            catch (MessagingException e)
            {
                String errorMessage = 
                    "ERROR: Unable to send email. " + 
                        "Check Tomcat logs for details.<br>" +
                    "NOTE: You may need to configure your system " + 
                        "as described in chapter 14.<br>" +
                    "ERROR MESSAGE: " + e.getMessage();
                request.setAttribute("errorMessage", errorMessage);
                this.log(
                    "Unable to send email. \n" +
                    "Here is the email you tried to send: \n" +
                    "=====================================\n" +
                    "TO: " + email + "\n" +
                    "FROM: " + from + "\n" +
                    "SUBJECT: " + subject + "\n" +
                    "\n" +
                    body + "\n\n");
            
            }    
        // forward request to JSP
        String url = "/User Forum.jsp";
        getServletContext()
                .getRequestDispatcher(url)
                    .forward(request, response);
    
    }
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}