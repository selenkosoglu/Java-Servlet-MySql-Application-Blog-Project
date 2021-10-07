package utils;

import props.Author;
import props.Blog;
import props.Contact;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DBUtil {

    static int id;

    public boolean login(String email, String password,String remember,HttpServletRequest req, HttpServletResponse resp){
        boolean status = false;
        DB db = new DB();
        try {
            String sql = "select * from author where email = ? and password = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, Util.MD5(password));
            ResultSet rs = pre.executeQuery();
            status = rs.next();
            if(status){
                // session create
                int aid = rs.getInt("aid");
                String name = rs.getString("name");

                req.getSession().setAttribute("aid", aid);
                req.getSession().setAttribute("name", name);

                //cookie create
                if(remember != null && remember.equals("on")) {
                    name = name.replace(" ", "_");
                    String val = aid+"_"+name;
                    Cookie cookie = new Cookie("user", val);
                    cookie.setMaxAge(60*60);
                    resp.addCookie(cookie);
                }
            }
            id = rs.getInt("aid");
        } catch (Exception e) {
            System.err.println("login Error : " + e);
        } finally {
            db.close();
        }

        return status;
    }

    //BLOG INSERT
    public int blogInsert(Blog blog, int aid){
        int status = 0;
        DB db = new DB();
        try {
            String sql = "insert into blogs values (null,?, ?, ?, ?,now())";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,blog.getTitle());
            pre.setString(2, blog.getBlog());
            pre.setString(3, blog.getDetail());
            pre.setInt(4,aid);
            status = pre.executeUpdate();
        } catch (Exception e) {
            System.err.println("blogInsert Error: " + e);
        } finally {
            db.close();
        }
        return status;
    }

    // BLOG LIST
    public List<Blog> allBlog(int aid ) {

        List<Blog> ls = new ArrayList<>();
        DB db = new DB();
        try {
            String sql = "select * from blogs where aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, aid );
            ResultSet rs = pre.executeQuery();
            while ( rs.next() ) {
                int bid = rs.getInt("bid");
                String title = rs.getString("title");
                String blog = rs.getString("blog");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");



                Blog blog1 = new Blog(bid,title,blog,detail,date);
                ls.add(blog1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }

        return ls;
    }

    // BLOG DELETE
    public int blogDelete( int bid) {
        int status = 0;
        DB db = new DB();
        try {
            String sql = "delete from blogs where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, bid);
            status = pre.executeUpdate();
        } catch (Exception e) {
            System.err.println("blogDelete Error :  " + e);
        } finally {
            db.close();
        }
        return status;
    }

    //BLOG CHECK
    public boolean isBlogValid( int bid, int aid ) {
        boolean status = false;
        DB db = new DB();
        try {
            String sql = "select * from blogs where bid = ? and aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, bid);
            pre.setInt(2, aid);
            ResultSet rs = pre.executeQuery();
            status = rs.next();
        }catch (Exception ex) {
            System.err.println("isBlogValid Error : " + ex);
        }finally {
            db.close();
        }
        return status;
    }

    //BLOG UPDATE
    public int updateBlog(String title, String blog, String detail,int bid){
        int status = 0;
        DB db = new DB();
        try {
            String sql = "update blogs set title = ?, blog= ?, detail = ?  where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,title);
            pre.setString(2,blog);
            pre.setString(3,detail);
            pre.setInt(4,bid);
            status = pre.executeUpdate();
        }catch (Exception e){
            System.err.println("updateProduct Error : " + e);
        }finally {
            db.close();
        }
        return status;
    }

    //SELECT SINGLE ITEM FROM BLOG TABLE
    public Blog singleBlog( int bid ) {
        Blog blog1 = new Blog();
        DB db = new DB();

        try {
            String sql = "select * from blogs where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, bid);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int pidx = rs.getInt("bid");
                String title = rs.getString("title");
                String blog = rs.getString("blog");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");
                blog1 = new Blog(pidx,title,blog,detail,date);
                return blog1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }

        return blog1;
    }

    //PASSWORD CHECK
    public boolean isPasswordValid(int aid, String password){
        boolean status = false;
        DB db = new DB();
        try {
            String sql = "select password from author where aid=? and password=?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,aid);
            pre.setString(2,Util.MD5(password));
            ResultSet rs = pre.executeQuery();
            status = rs.next();
        } catch (Exception e) {
            System.err.println("Password Valid Error: " + e);
        } finally {
            db.close();
        }
        return status;
    }

    //PASSWORD CHANGE
     public int changePassword(int aid,String password) {
        int status = 0;
        DB db = new DB();
         try {
             String sql ="update author set password=? where aid=?";
             PreparedStatement pre = db.conn.prepareStatement(sql);
             pre.setString(1,Util.MD5(password));
             pre.setInt(2, aid);
             status = pre.executeUpdate();
         } catch (Exception e) {
             System.err.println("userPasswordUpdate Error : " + e);
         } finally {
             db.close();
         }
         return status;
     }

    //MESSAGE SENT
    public int contactInsert(Contact contact) {
        int status = 0;
        DB db = new DB();

        try {
            String sql ="insert into contact_table values (null,?,?,?,?)";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,contact.getName());
            pre.setString(2,contact.getEmail());
            pre.setString(3,contact.getPhoneNumber());
            pre.setString(4,contact.getMessage());
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }
        return status;
    }

    //LIST BLOGS IN THE FIRST PAGE
    public List<Blog> allBlogList() {
        List<Blog> blogList = new ArrayList<>();
        DB db = new DB();
        try {
            String sql = "select * from blogs";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int bid = rs.getInt("bid");
                String title = rs.getString("title");
                String blog = rs.getString("blog");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");
                Blog blog1 = new Blog(bid,title,blog,detail,date);
                blogList.add(blog1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }
        return blogList;
    }

    // BLOG LIST
    public List<Blog> allAuthor() {

        List<Blog> ls = new ArrayList<>();
        DB db = new DB();
        try {
            String sql = "select * from blogs join author on blogs.aid = author.aid";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while ( rs.next() ) {
                int bid = rs.getInt("bid");
                String title = rs.getString("title");
                String blog = rs.getString("blog");
                String detail = rs.getString("detail");
                String name = rs.getString("name");
                Date date = rs.getDate("date");


                Blog blog1 = new Blog(bid,title,blog,detail,date);
                blog1.setName(name);
                ls.add(blog1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }

        return ls;
    }



}
