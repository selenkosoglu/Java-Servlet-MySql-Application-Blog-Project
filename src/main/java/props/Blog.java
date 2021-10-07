package props;

import java.util.Date;

public class Blog {

    private int bid;
    private String title;
    private String blog;
    private String detail;
    private String name;
    private Date date;



    public Blog(int bid, String title, String blog, String detail,Date date) {
        this.bid = bid;
        this.title = title;
        this.blog = blog;
        this.detail = detail;
        this.date = date;
    }


    public Blog() {

    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBlog() {
        return blog;
    }

    public void setBlog(String blog) {
        this.blog = blog;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
