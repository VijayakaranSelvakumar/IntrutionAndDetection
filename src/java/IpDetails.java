
import com.maxmind.geoip.LookupService;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author stigmata
 */
public class IpDetails {
    public static void main(String[] args) throws IOException {
         File    datapath = new File("D:\\GeoLiteCity.dat");
            LookupService cl = new LookupService(datapath,
                    LookupService.GEOIP_MEMORY_CACHE
                            | LookupService.GEOIP_CHECK_CACHE);
        String ipAddress = "82.146.237.146";
            String cityName = cl.getLocation(ipAddress).city;
            System.out.println(cityName);
    }
    
}
