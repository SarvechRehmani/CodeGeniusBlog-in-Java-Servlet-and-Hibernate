package com.genius.blog.Entities;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int catId;
    private String catName;
    @OneToMany (mappedBy = "pCatId")
    private List<Post> postId;

    public Category() {
    }

    public Category(int catId, String catName, List<Post> postId) {
        this.catId = catId;
        this.catName = catName;
        this.postId = postId;
    }

    public Category(String catName, List<Post> postId) {
        this.catName = catName;
        this.postId = postId;
    }

    public Category(String catName) {
        this.catName = catName;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public List<Post> getPostId() {
        return postId;
    }

    public void setPostId(List<Post> postId) {
        this.postId = postId;
    }

    
    
}
