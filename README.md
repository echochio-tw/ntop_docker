# ntop_docker

 Note: “Ntop” != “NtopNG”.
 ----------

pull docker
-----------
     docker pull echochio/ntop
 
exec docker  echochio/ntop
-----------
 
 netflow come from 9996 udp
 
 make log in /log
    
     mkdir /log
 
 make data in /data

     mkdir /data
     chmod 777 /data

 Run docker  

     docker run -d -e Local=192.168.0.0/16 -p 192.168.0.70:3001:3001 -p 9996:9996/udp --name=ntop echochio/ntop

Browser
 
     https://192.168.0.70:3001/
     
Set up flow

![alt tag](https://github.com/chio-nzgft/ntop_docker/raw/master/p1.png)
     
