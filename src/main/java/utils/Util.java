package utils;

import props.Author;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Util {

    public final static String base_url = "http://localhost:8080/Blog_war_exploded/";


    public static String MD5(String md5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        }
        return null;
    }


    public Author isLogin(HttpServletRequest request, HttpServletResponse response) {
        if (request.getCookies() != null ) {
            Cookie[] cookies = request.getCookies();
            for ( Cookie cookie : cookies ) {
                if ( cookie.getName().equals("user") ) {
                    String vales = cookie.getValue();
                    try {
                        String[] arr = vales.split("_");
                        request.getSession().setAttribute("aid", Integer.parseInt(arr[0]) );
                        request.getSession().setAttribute("name",arr[1] + " " + arr[2] );
                    } catch (NumberFormatException e) {
                        Cookie cookie1 = new Cookie("user", "");
                        cookie1.setMaxAge(0);
                        response.addCookie(cookie1);
                    }
                    break;
                }
            }
        }
        Object sessionObj = request.getSession().getAttribute("aid");
        Author author = new Author();
        if ( sessionObj == null ) {
            try {
                response.sendRedirect(base_url);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            int aid = (int) request.getSession().getAttribute("aid");
            String name = (String) request.getSession().getAttribute("name");
            author.setAid(aid);
            author.setName(name);
        }
        return author;
    }
}
