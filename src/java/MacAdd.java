
import java.net.InetAddress;
import java.net.NetworkInterface;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author stigmata
 */
public class MacAdd {
    public static String getMAC(){
         try{
            InetAddress inetaddress=InetAddress.getLocalHost(); //Get LocalHost refrence
             
            //get Network interface Refrence by InetAddress Refrence
            NetworkInterface network = NetworkInterface.getByInetAddress(inetaddress); 
            byte[] macArray = network.getHardwareAddress();  //get Harware address Array
            StringBuilder str = new StringBuilder();
             
            // Convert Array to String 
            for (int i = 0; i < macArray.length; i++) {
                    str.append(String.format("%02X%s", macArray[i], (i < macArray.length - 1) ? "-" : ""));
            }
            String macAddress=str.toString();
         
            return macAddress; //return MAc Address
        }
        catch(Exception E){
            E.printStackTrace();  //print Exception StackTrace
            return null;
        } 
    }
    
}
