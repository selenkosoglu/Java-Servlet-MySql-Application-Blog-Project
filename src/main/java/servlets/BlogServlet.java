package servlets;

import props.Author;
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

@WebServlet(name = "blogServlet", value = "/blog-servlet")
public class BlogServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Blog blog  = new Blog();

        blog.setTitle(req.getParameter("title"));
        blog.setBlog(req.getParameter("blog"));
        blog.setDetail(req.getParameter("detail"));


        DBUtil util = new DBUtil();
        Author author = new Author();
        int aid = (int) req.getSession().getAttribute("aid");

        int status = util.blogInsert(blog,aid);
        if(status>0) {
            resp.sendRedirect(Util.base_url + "blog.jsp");
        }else {
            String errorMessage = "";
            if (status == 0) {
                errorMessage = "Ekleme sırasında bir hata oluştu";

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bid = req.getParameter("bid");
        String ipAddress = req.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = req.getRemoteAddr();
        }
        try {
            int cbid = Integer.parseInt(bid);
            int aid = (int) req.getSession().getAttribute("aid");
            DBUtil util = new DBUtil();
            if ( util.isBlogValid(cbid, aid) ) {
                int status = util.blogDelete(cbid);
                if ( status > 0 ) { }
            }
        } catch (NumberFormatException e) {
            System.err.println("Delete item Error : " + ipAddress + " Error " + e);
        }
        resp.sendRedirect(Util.base_url+"blog.jsp");
    }
}
