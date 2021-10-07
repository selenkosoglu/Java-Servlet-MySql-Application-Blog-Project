package servlets;

import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "logInServlet", value = "/login-servlet")
public class LogInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        DBUtil util = new DBUtil();
        boolean status = util.login(email,password,remember,req,resp);

        System.out.println(email+" " + password);
        System.out.println("Giriş durumu: "+ status);

        if (status) {
            resp.sendRedirect(Util.base_url + "blog.jsp");
        }else {
            req.setAttribute("loginError", "Kullanıcı Adı ya da Şifre Hatalı!");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/");
            dispatcher.forward(req,resp);
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("doget");
        resp.sendRedirect(Util.base_url + "login.jsp");
    }
}
