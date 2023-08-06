package com.genius.blog.Entities;

import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pId;
    private String pTitle;
    private String pContent;
    private String pPic = "blogPic.png";
    private Date pDate;
    @ManyToOne
    private Category pCatId;
    @ManyToOne
    private Users uPId;
    @OneToMany (mappedBy = "post", cascade = CascadeType.ALL)
    private List<LikeTable> postLikes;

    public Post() {
    }

    public Post(String pTitle, String pContent, String pPic, Date pDate, Category pCatId, Users uPId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pPic = pPic;
        this.pDate = pDate;
        this.pCatId = pCatId;
        this.uPId = uPId;
    }

    public Post(String pTitle, String pContent, Date pDate, Category pCatId, Users uPId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pDate = pDate;
        this.pCatId = pCatId;
        this.uPId = uPId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Date getpDate() {
        return pDate;
    }

    public void setpDate(Date pDate) {
        this.pDate = pDate;
    }

    public Category getpCatId() {
        return pCatId;
    }

    public void setpCatId(Category pCatId) {
        this.pCatId = pCatId;
    }

    public Users getuPId() {
        return uPId;
    }

    public void setuPId(Users uPId) {
        this.uPId = uPId;
    }

}
