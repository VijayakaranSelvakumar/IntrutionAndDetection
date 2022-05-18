/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

/**
 *
 * @author stigmata
 */
public interface DbQuery {
    public static final String Al_REG="select * from reg where name=?";
    
    public static final String MAl_REG="select * from managerreg where name=?";
    
    public static final String REG="insert into reg(name,pass,gender,dob,mail,con,sourceip,mac)values(?,?,?,?,?,?,?,?)";
    
    public static final String MREG="insert into managerreg(name,pass,gen,dob,mail,contact,ip1,macc,ename,epass,egen,edob,ema,econ)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    
    
    public static final String LOGIN="select * from reg where name=? and pass=? and mail=?";
    
     public static final String MLOGIN="select * from managerreg where ename=? and epass=? and ema=?";
    
     public static final String DELIP="delete from nodes where ip1= 'ipadd'";
    public static final String IPCHECK="insert into nodes (nodeAdd)values(?)";
//    public static final String IPCHECK="update nodes set nodeAdd=? ";
    public static final String GETIP="select * from nodes";
    
    
     public static final String BLOCKSTATUS="select * from ipdet where status='noattack'";
   
}
