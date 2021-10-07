package servlets;

import com.mysql.cj.Session;
import props.Blog;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "blogUpdateServlet", value = "/blog-update")

public class BlogUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bid = Integer.parseInt(req.getParameter("bid"));
        int aid = (int) req.getSession().getAttribute("aid");
        DBUtil util = new DBUtil();
        if (util.isBlogValid(bid,aid)) {
            req.getSession().setAttribute("updateBid", bid);
            Blog blog = util.singleBlog(bid);
            req.setAttribute("blog", blog);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/blogupdate.jsp");
            dispatcher.forward(req, resp);
        }
        resp.sendRedirect(Util.base_url + "blog.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean bidStatus = req.getSession().getAttribute("updateBid") != null;
        if ( bidStatus ) {
            String title = req.getParameter("title");
            String blog = req.getParameter("blog");
            String detail = req.getParameter("detail");
            int bid = (int) req.getSession().getAttribute("updateBid");
            int aid = (int) req.getSession().getAttribute("aid");

            DBUtil util = new DBUtil();

            int status = util.updateBlog(title, blog, detail, bid);

            req.getSession().removeAttribute("updateBid");
        }

        resp.sendRedirect(Util.base_url+"blog.jsp");
    }
}

