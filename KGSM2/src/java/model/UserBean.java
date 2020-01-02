/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


/**
 *
 * @author tiqah isza
 */
public class UserBean {
    private String id;
    private String fname;
    private String uname;
    private String upass;
    private String noic;
    private String email;
    private String phoneNo;
    private String address;
    private String utype;
    private int utypeid;
    private boolean valid;
    private String base64Image;
    
    public String getID()
    {
        return id;
    }
    
    public void setID(String newID)
    {
        id = newID;
    }
    
    public String getFullName()
    {
        return fname;
    }
    
    public void setFullName(String newFullName)
    {
        fname = newFullName;
    }
    
    public String getName()
    {
        return uname;
    }
    
    public void setName(String newName)
    {
        uname = newName;
    }
    
    public String getPass()
    {
        return upass;
    }
    
    public void setPass(String newPass)
    {
        upass = newPass;
    }
    
    public String getIC()
    {
        return noic;
    }
    
    public void setIC(String newIC)
    {
        noic = newIC;
    }
    
    public String getEmail()
    {
        return email;
    }
    
    public void setEmail(String newEmail)
    {
        email = newEmail;
    }
    
    public String getPhoneNo()
    {
        return phoneNo;
    }
    
    public void setPhoneNo(String newPhoneNo)
    {
        phoneNo = newPhoneNo;
    }
    
    public String getAddress()
    {
        return address;
    }
    
    public void setAddress(String newAddress)
    {
        address = newAddress;
    }
    
    public String getUserType()
    {
        return utype;
    }
    
    public void setUserType(String newUserType)
    {
        utype = newUserType;
    }
    
    public int getUserTypeID()
    {
        return utypeid;
    }
    
    public void setUserTypeID(int newUserTypeId)
    {
        utypeid = newUserTypeId;
    }
    
    public boolean isValid() {
        return valid;
    }
    
    public void setValid(boolean newValid) {
        valid = newValid;
    }
    
    public String getBase64Image() {
        return base64Image;
    }
 
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
    
}
