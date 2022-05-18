// Java program to demonstrate 
// how to fetch public IP Address 

import java.net.*;
import java.*;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;

class GFG {

    public static void main(String[] args) {
        try {
            Enumeration nis = NetworkInterface.getNetworkInterfaces();
            while (nis.hasMoreElements()) {
                NetworkInterface ni = (NetworkInterface) nis.nextElement();
                Enumeration ias = ni.getInetAddresses();
                while (ias.hasMoreElements()) {
                    InetAddress ia = (InetAddress) ias.nextElement();
                    System.out.println(ia.getHostAddress());
                }

            }
        } catch (SocketException ex) {
            Logger.getLogger(GFG.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
