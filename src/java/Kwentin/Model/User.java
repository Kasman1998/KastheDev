/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Kwentin.Model;

/**
 *
 * @author beadb
 */

import java.io.Serializable;

/**
 * The purpose for the User class is that model of the web application.This 
 * module is used to set and get the values for the web application.
 * @author Kasman98
 */
public class User  implements Serializable{
    private String firstName;
    private String lastName;
    private String email;
    private String heardFrom;
    private String wantsUpdates;
    private String contactVia;
    private int date;
/**
 * User Constuctor
 */
    public User() {
       firstName="";
       lastName ="";
        email = "";
        this.heardFrom = "";
        this.wantsUpdates = "";
        this.contactVia = "";
        this.date=0;
    }
/**
 * Setter and getter are there to assigned and return values for the web 
 * application.
 * @return 
 */
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHeardFrom() {
        return heardFrom;
    }

    public void setHeardFrom(String heardFrom) {
        this.heardFrom = heardFrom;
    }

    public String getWantsUpdates() {
        return wantsUpdates;
    }

    public void setWantsUpdates(String wantsUpdates) {
        this.wantsUpdates = wantsUpdates;
    }

    public String getContactVia() {
        return contactVia;
    }

    public void setContactVia(String contactVia) {
        this.contactVia = contactVia;
    }

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }
    
    
}
