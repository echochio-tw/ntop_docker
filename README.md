# ntop_docker

 Note: “Ntop” != “NtopNG”.
 ----------

pull docker
-----------
     docker pull echochio/ntop
 
exec docker  echochio/ntop
-----------
 
 netflow come from 9997 udp
 
 make log in /log
    
     mkdir /log
 
 make data in /data

     mkdir /data
     chmod 777 /data

 Run docker  

     docker run -d -e Local=192.168.0.0/16 -p 192.168.0.70:3001:3001 -p 9997:9997/udp --name=ntop echochio/ntop

Browser
 
     https://192.168.0.70:3001/
     
Set up flow

![alt tag](https://github.com/chio-nzgft/cacti-wan-speed-cheker/blob/master/images/1481787019-2075263314_n.png)
     
