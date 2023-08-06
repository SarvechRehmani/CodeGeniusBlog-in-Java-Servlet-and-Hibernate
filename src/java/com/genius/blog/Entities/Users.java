package com.genius.blog.Entities;

import java.util.Date;
import java.util.List;
import javax.persistence.*;

@Entity
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String gender;

    private Date date;

    private String profile = "Default.png";

    @OneToMany(mappedBy = "uPId")
    private List<Post> postId;
    
     @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<LikeTable> userLikes;

    public Users() {
    }

    public Users(String name, String email, String password, String gender, Date date) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.date = date;
    }
    

    public Users(String name, String email, String password, String gender, Date date, List<Post> postId) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.date = date;
        this.postId = postId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public List<Post> getPostId() {
        return postId;
    }

    public void setPostId(List<Post> postId) {
        this.postId = postId;
    }
}
