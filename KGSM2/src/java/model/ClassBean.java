/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author User
 */
public class ClassBean {
    private String class_ID;
    private String class_Name;
    private String class_Venue;
    private String class_Date;
    private String class_Time;
    private String class_Payment;
    private String class_Desc;
    private String coach_id;
    private String class_Category;
    private boolean valid;
    private String base64Image;
    
    public String getclass_ID()
    {
        return class_ID;
    }
    
    public void setclass_ID(String class_ID)
    {
        this.class_ID = class_ID;
    }
    
    public String getclass_Name()
    
    {
        return class_Name;
    }
    
    public void setclass_Name(String class_Name)
    {
        this.class_Name = class_Name;
    }
    
    public String getclass_Venue()
   {
        return class_Venue;
    }
    
    public void setclass_Venue(String class_Venue)
    {
        this.class_Venue = class_Venue;
    }
    
    public String getclass_Date()
    {
        return class_Date;
    }
    public void setclass_Date(String class_Date)
    {
        this.class_Date = class_Date;
    }
    
    public String getclass_Time()
    {
        return class_Time;
    
    }
    public void setclass_Time(String class_Time)
    {
        this.class_Time = class_Time;
    }
    
    public String getclass_Payment()
    {
        return class_Payment;
    }
    public void setclass_Payment(String class_Payment)
    {
        this.class_Payment = class_Payment;
    }
    public String getclass_Desc()
    {
        return class_Desc;
    }
    
    public void setclass_Desc(String class_Desc)
    {
        this.class_Desc = class_Desc;
    }
    
    public String getCoach_ID()
    {
        return coach_id;
    }
    public void setCoach_ID(String coach_Newid)
    {
        this.coach_id = coach_Newid;
    }
    
    public String getclass_Category()
    {
        return class_Category;
    }
    public void setclass_Category(String class_Category)
    {
        this.class_Category = class_Category;
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
