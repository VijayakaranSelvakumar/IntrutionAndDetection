function validate(){  
var name=document.f1.name.value;  
var password=document.f1.pass.value;  
var status=false;  
  
if(name.length<1){  
document.getElementById("nameloc").innerHTML=  
" <img src='img/uncheck.gif'/> Please enter your name";  
status=false;  
}else{  
document.getElementById("nameloc").innerHTML=" <img src='img/check.gif'/>";  
status=true;  
}  
if(password.length<6){  
document.getElementById("passwordloc").innerHTML=  
" <img src='img/uncheck.gif'/> Password must be at least 6 char long";  
status=false;  
}else{  
document.getElementById("passwordloc").innerHTML=" <img src='img/check.gif'/>";  
}  
return status;  
}  