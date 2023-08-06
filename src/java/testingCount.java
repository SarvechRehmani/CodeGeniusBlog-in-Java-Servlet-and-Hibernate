
import com.genius.blog.Dao.Dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */

/**
 *
 * @author sarwe
 */
public class testingCount {

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        long  count = Dao.countLikesOnPost(1);
        System.out.print(count);
    }
}
