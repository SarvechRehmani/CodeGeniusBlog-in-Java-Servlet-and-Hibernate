/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.genius.blog.Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author sarwe
 */
@Entity
public class LikeTable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int likeId;

    @ManyToOne
    private Post post;

    @ManyToOne
    private Users user;

    public LikeTable() {
    }

    public LikeTable(Post post, Users user) {
        this.post = post;
        this.user = user;
    }

    public LikeTable(int likeId, Post post, Users user) {
        this.likeId = likeId;
        this.post = post;
        this.user = user;
    }

    public int getLikeId() {
        return likeId;
    }

    public void setLikeId(int likeId) {
        this.likeId = likeId;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

}
