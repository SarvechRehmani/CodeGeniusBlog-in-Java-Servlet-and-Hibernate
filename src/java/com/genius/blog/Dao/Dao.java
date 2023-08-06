/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.genius.blog.Dao;

import com.genius.blog.Entities.Category;
import com.genius.blog.Entities.LikeTable;
import com.genius.blog.Entities.Users;
import com.genius.blog.Entities.Post;
import com.genius.blog.helper.FactoryProvider;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author sarwe
 */
public class Dao {

    public static List<Category> getAllCategories() {
        List<Category> list = new ArrayList();

        try {
            Session s = FactoryProvider.getFactory().openSession();

            Query q = s.createQuery("from Category");
            list = q.list();
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Post> getAllPosts() {
        List<Post> list = new ArrayList();
        try {
            Session s = FactoryProvider.getFactory().openSession();
            Query q = s.createQuery("from Post order by pId desc");
            list = q.list();
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Post> getPostsById(int catId) {
        List<Post> list = new ArrayList();
        try {
            Session s = FactoryProvider.getFactory().openSession();
            Category cat = s.load(Category.class, catId);
            Query q = s.createQuery("from Post where pCatId=:c order by pId desc");
            q.setParameter("c", cat);
            list = q.list();
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean insertLike(int postId, int userId) {
        boolean flag = false;
        try {
            Session s = FactoryProvider.getFactory().openSession();
            Post post = s.load(Post.class, postId);
            Users user = s.load(Users.class, userId);
            LikeTable like = new LikeTable(post, user);
            Transaction tx = s.beginTransaction();
            s.save(like);
            tx.commit();
            s.close();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static long countLikesOnPost(int postId) {
        long count = 0;
        try {
            Session s = FactoryProvider.getFactory().openSession();
            Post post = s.load(Post.class, postId);
            Query q = s.createQuery("select count(*) from LikeTable where post = :p");
            q.setParameter("p", post);
            count = (long) q.uniqueResult();

            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static boolean isLikedByUser(int postId, int userId) {
        boolean flag = false;
        try {
            Session s = FactoryProvider.getFactory().openSession();
            Post post = s.load(Post.class, postId);
            Users user = s.load(Users.class, userId);
            Query q = s.createQuery("from LikeTable where post = :p and user = :u");
            q.setParameter("p", post);
            q.setParameter("u", user);
            List<LikeTable> list = q.list();
            if (!list.isEmpty()) {
                flag = true;
            }
            s.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static boolean deleteLike(int postId, int userId) {
        boolean flag = false;

        try {
            Session s = FactoryProvider.getFactory().openSession();
            Post post = s.load(Post.class, postId);
            Users user = s.load(Users.class, userId);
            Transaction tx = s.beginTransaction();
            Query q = s.createQuery("delete from LikeTable where post = :p and user = :u");
            q.setParameter("p", post);
            q.setParameter("u", user);
            q.executeUpdate();
            flag = true;
            tx.commit();
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
