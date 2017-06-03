package services.session;

import java.util.*;
import javax.servlet.http.*;

import services.database.*;
import services.database.exception.*;

import blogics.*;

public class Session {
  
    public Session() {}

    public static Cookie[] createUserCookie(Database database, User user) 
        throws RecoverableDBException {
        
        Cookie[] cookies=new Cookie[6];

        cookies[0]= new Cookie("id", String.valueOf(user.getId()));
        cookies[1] = new Cookie("email", user.getEmail());
        cookies[2]= new Cookie("name", user.getName());
        cookies[3] = new Cookie("surname", user.getSurname());
        cookies[4]= new Cookie("admin", String.valueOf(user.isAdmin()));
        cookies[5] = new Cookie("blocked", String.valueOf(user.isBlocked()));

        for (Cookie cookie : cookies) {
            // setto il path a root cosi il cookie vale per tutta l'applicazione
            cookie.setPath("/");
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