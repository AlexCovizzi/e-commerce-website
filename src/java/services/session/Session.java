package services.session;

import java.util.*;
import javax.servlet.http.*;

//import util.*;
import services.errorservice.*;
import services.database.*;
import services.database.exception.*;

import blogics.*;

public class Session {
  
    public Session() {}

    public static Cookie[] createUserCookie(Database database, int userId) 
        throws RecoverableDBException {

        User user = UserService.getUser(database, userId);
        
        Cookie[] cookies=new Cookie[2];

        cookies[0]= new Cookie("userId", String.valueOf(userId));
        cookies[1] = new Cookie("email", user.getEmail());

        for (int i=0; i<cookies.length; i++) {
            // setto il path a root cosi il cookie vale per tutta l'applicazione
            cookies[i].setPath("/");
        }

        return cookies;
    }

    public static String getValue(Cookie cookies[], String name, int position) {
        int i;
        boolean found=false;
        String value=null;

        for (i=0;i<cookies.length && !found;i++) {
            if (cookies[i].getName().equals(name)) {
                Vector oV = util.Conversion.tokenizeString(cookies[i].getValue(),"#");
                value=(String)oV.elementAt(position);
                found=true;
            }
        }

        return value;
    }

    public static Cookie[] deleteCookie(Cookie[] cookies) {
        for (int i=0; i<cookies.length; i++) {
            cookies[i].setMaxAge(0);
            cookies[i].setPath("/");
        }

        return cookies;
    }  

    public static void showCookies(Cookie[] cookies){
        util.Debug.println("Cookie presenti:" + cookies.length);
        int i;
        for (i=0;i< cookies.length;i++) {
            util.Debug.println("Nome:" + cookies[i].getName() + " Valore:" +cookies[i].getValue());
        }
    }
  
}