
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetSocketAddress;
import java.net.SocketException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */ 

/**
 *
 * @author stigmata
 */
import java.net.*;
import java.util.Properties;
import java.util.Set;
 
 public class PortScanner
 
{
  public static void main(String args[]){
         
        Properties properties = System.getProperties();
        Set<Object> keys = properties.keySet();
        for(Object key : keys){
            System.out.println(key + ": " + properties.get(key));
        }
}
 }
