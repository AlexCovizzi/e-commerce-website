package bflows;

import java.beans.*;

/**
 *
 * @author  Mario Zambrini
 * @version 1.0
 */
public class RecipientManagement implements java.io.Serializable {

    /** Holds value of property firstname. */
    private String firstname;
    
    /** Holds value of property surname. */
    private String surname;
    
    /** Holds value of property address. */
    private String address;
    
    /** Holds value of property cap. */
    private String cap;
    
    /** Holds value of property city. */
    private String city;
    
    /** Holds value of property phone. */
    private String phone;
    
    /** Holds value of property birthDay. */
    private int birthDay;
    
    /** Holds value of property birthMonth. */
    private int birthMonth;
    
    /** Holds value of property birthYear. */
    private int birthYear;
    
    /** Holds value of property correctFirstname. */
    private boolean correctFirstname;
    
    /** Holds value of property correctSurname. */
    private boolean correctSurname;
    
    /** Holds value of property correctAddress. */
    private boolean correctAddress;
    
    /** Holds value of property correctCap. */
    private boolean correctCap;
    
    /** Holds value of property correctCity. */
    private boolean correctCity;
    
    /** Holds value of property correctPhone. */
    private boolean correctPhone;
    
    /** Holds value of property correctBirthDate. */
    private boolean correctBirthDate;
    
    /** Creates new RecipientManagement */
    public RecipientManagement() {
    }

    public void VerifyRecipient() {
     
        setCorrectFirstname(firstname!=null && isAlpha(firstname));
        setCorrectSurname(surname!=null && isAlpha(getSurname()));
        setCorrectAddress(address!=null);
        setCorrectCap(cap !=null && cap.length()==5 && isNumber(cap));
        setCorrectCity(city!=null && isAlpha(city));
        setCorrectPhone(phone!=null);
        
        setCorrectBirthDate(true);
        if ( ( birthMonth==10 || birthMonth==3 || 
               birthMonth==5 || birthMonth==8 ) &&
             birthDay>30 )
             setCorrectBirthDate(false);
        if ( birthMonth==1 ) 
            if ( (birthYear%4)==0 && (birthYear%100)!=0 && birthDay>29 )
                    setCorrectBirthDate(false);
            else if ( (birthYear%4)==0 && (birthYear%100)==0 && (birthYear%400)!=0 && birthDay>28 )
                    setCorrectBirthDate(false);        
            else if ( (birthYear%4)==0 && (birthYear%100)==0 && (birthYear%400)==0 && birthDay>29 )
                    setCorrectBirthDate(false);        
            else if ( (birthYear%4)!=0 && birthDay>28)
                    setCorrectBirthDate(false);                
    }
    
    private boolean isAlpha(String alpha) { 

        int i=0;
        boolean foundDigit=false;
        
        while (!foundDigit && i<alpha.length()) {
            foundDigit=Character.isDigit(alpha.charAt(i));
            i++;            
        }
        
        return !foundDigit; 
    
    }
    
    private boolean isNumber(String number) {
        
        try {
          Long.parseLong(number);
          return true;
        } catch (NumberFormatException ex) {
          return false;
        }
            
    }
    
    
    /** Getter for property firstname.
     * @return Value of property firstname.
     */
    public String getFirstname() {
        return firstname;
    }
    
    /** Setter for property firstname.
     * @param firstname New value of property firstname.
     */
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    
    /** Getter for property surname.
     * @return Value of property surname.
     */
    public String getSurname() {
        return surname;
    }
    
    /** Setter for property surname.
     * @param surname New value of property surname.
     */
    public void setSurname(String surname) {
        this.surname = surname;
    }
    
    /** Getter for property address.
     * @return Value of property address.
     */
    public String getAddress() {
        return address;
    }
    
    /** Setter for property address.
     * @param address New value of property address.
     */
    public void setAddress(String address) {
        this.address = address;
    }
    
    /** Getter for property cap.
     * @return Value of property cap.
     */
    public String getCap() {
        return cap;
    }
    
    /** Setter for property cap.
     * @param cap New value of property cap.
     */
    public void setCap(String cap) {
        this.cap = cap;
    }
    
    /** Getter for property city.
     * @return Value of property city.
     */
    public String getCity() {
        return city;
    }
    
    /** Setter for property city.
     * @param city New value of property city.
     */
    public void setCity(String city) {
        this.city = city;
    }
    
    /** Getter for property phone.
     * @return Value of property phone.
     */
    public String getPhone() {
        return phone;
    }
    
    /** Setter for property phone.
     * @param phone New value of property phone.
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    /** Getter for property birthDay.
     * @return Value of property birthDay.
     */
    public int getBirthDay() {
        return birthDay;
    }
    
    /** Setter for property birthDay.
     * @param birthDay New value of property birthDay.
     */
    public void setBirthDay(int birthDay) {
        this.birthDay = birthDay;
    }
    
    /** Getter for property birthMonth.
     * @return Value of property birthMonth.
     */
    public int getBirthMonth() {
        return birthMonth;
    }
    
    /** Setter for property birthMonth.
     * @param birthMonth New value of property birthMonth.
     */
    public void setBirthMonth(int birthMonth) {
        this.birthMonth = birthMonth;
    }
    
    /** Getter for property birthYear.
     * @return Value of property birthYear.
     */
    public int getBirthYear() {
        return birthYear;
    }
    
    /** Setter for property birthYear.
     * @param birthYear New value of property birthYear.
     */
    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }
    
    /** Getter for property correctFirstname.
     * @return Value of property correctFirstname.
     */
    public boolean isCorrectFirstname() {
        return correctFirstname;
    }
    
    /** Setter for property correctFirstname.
     * @param correctFirstname New value of property correctFirstname.
     */
    public void setCorrectFirstname(boolean correctFirstname) {
        this.correctFirstname = correctFirstname;
    }
    
    /** Getter for property correctSurname.
     * @return Value of property correctSurname.
     */
    public boolean isCorrectSurname() {
        return correctSurname;
    }
    
    /** Setter for property correctSurname.
     * @param correctSurname New value of property correctSurname.
     */
    public void setCorrectSurname(boolean correctSurname) {
        this.correctSurname = correctSurname;
    }
    
    /** Getter for property correctAddress.
     * @return Value of property correctAddress.
     */
    public boolean isCorrectAddress() {
        return correctAddress;
    }
    
    /** Setter for property correctAddress.
     * @param correctAddress New value of property correctAddress.
     */
    public void setCorrectAddress(boolean correctAddress) {
        this.correctAddress = correctAddress;
    }
    
    /** Getter for property correctCap.
     * @return Value of property correctCap.
     */
    public boolean isCorrectCap() {
        return correctCap;
    }
    
    /** Setter for property correctCap.
     * @param correctCap New value of property correctCap.
     */
    public void setCorrectCap(boolean correctCap) {
        this.correctCap = correctCap;
    }
    
    /** Getter for property correctCity.
     * @return Value of property correctCity.
     */
    public boolean isCorrectCity() {
        return correctCity;
    }
    
    /** Setter for property correctCity.
     * @param correctCity New value of property correctCity.
     */
    public void setCorrectCity(boolean correctCity) {
        this.correctCity = correctCity;
    }
    
    /** Getter for property correctPhone.
     * @return Value of property correctPhone.
     */
    public boolean isCorrectPhone() {
        return correctPhone;
    }
    
    /** Setter for property correctPhone.
     * @param correctPhone New value of property correctPhone.
     */
    public void setCorrectPhone(boolean correctPhone) {
        this.correctPhone = correctPhone;
    }
    
    /** Getter for property correctBirthDate.
     * @return Value of property correctBirthDate.
     */
    public boolean isCorrectBirthDate() {
        return correctBirthDate;
    }
    
    /** Setter for property correctBirthDate.
     * @param correctBirthDate New value of property correctBirthDate.
     */
    public void setCorrectBirthDate(boolean correctBirthDate) {
        this.correctBirthDate = correctBirthDate;
    }
    
}
