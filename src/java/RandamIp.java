
import java.util.Random;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author stigmata
 */
public class RandamIp {
    public String  a() {
      Random r = new Random();
 
      String det=(+ r.nextInt(256) + "." + r.nextInt(256) + "." + r.nextInt(256) + "." + r.nextInt(256))  ;
        return det;
       
   }
    
    
    
}
