
import java.net.InetAddress;
import java.net.UnknownHostException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author stigmata
 */
public class Test {
    public static void main(String[] args) throws UnknownHostException {
            InetAddress ipp = InetAddress.getLocalHost();
            String ii = ipp.toString();
            String sub=ii.replaceAll("stigmata-PC/", "");
            
            System.out.println(sub);
    }
    
}
