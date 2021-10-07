package servlets;

import props.Blog;
import props.Contact;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "contactServlet", value = "/contact-servlet")
public class ContactServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Contact contact = new Contact();

        contact.setName(req.getParameter("name"));
        contact.setEmail(req.getParameter("email"));
        contact.setPhoneNumber(req.getParameter("phoneNumber"));
        contact.setMessage(req.getParameter("message"));

        DBUtil util = new DBUtil();



        int status = util.contactInsert(contact);
        if(status>0) {
            resp.sendRedirect(Util.base_url + "contact.jsp");
        }else {
            String errorMessage = "";
            if (status == 0) {
                errorMessage = "Ekleme sırasında bir hata oluştu";
                System.out.println(errorMessage);
                resp.sendRedirect(Util.base_url + "contact.jsp");

            }
        }
    }


}
