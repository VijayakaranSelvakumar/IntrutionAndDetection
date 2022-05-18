
import java.io.InputStream;
import java.util.Properties;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author stigmata
 */
public class GetConnection {
    private static Properties pro=null;
    
    public  GetConnection(){
        InputStream is=null;
        try{
            this.pro=new Properties();
            is=this.getClass().getResourceAsStream("/Db.properties");
            pro.load(is);
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
        
    }
    public String getPropertyValue(String key){
        return this.pro.getProperty(key);
    }
    public static void main(String[] args) {

    }
}
