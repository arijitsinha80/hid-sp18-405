dhcp-lease-list --lease PATH_TO_LEASE_FILE
To get manufacturer names please download http://standards.ieee.org/regauth/oui/oui.txt to /usr/local/etc/oui.txt
Reading leases from /var/lib/dhcp/dhcpd.leases
MAC                IP              hostname       valid until         manufacturer        
===============================================================================================
b8:27:eb:3a:7c:7c  192.168.2.103   red04          2018-02-25 21:56:13 -NA-                
b8:27:eb:60:b8:8e  192.168.2.100   red03          2018-02-25 21:56:11 -NA-                
b8:27:eb:9a:55:13  192.168.2.101   red02          2018-02-25 21:56:12 -NA-          


subnet 192.168.2.0 netmask 255.255.255.0 {
        range 192.168.2.100 192.168.2.200;
        option broadcast-address 192.168.2.255;
        option routers 192.168.2.1;
        max-lease-time 7200;
        option domain-name "rpi3";
        option domain-name-servers 8.8.8.8;
}



pi@red00:~ $ dhcp-lease-list --lease PATH_TO_LEASE_FILE
To get manufacturer names please download http://standards.ieee.org/regauth/oui/oui.txt to /usr/local/etc/oui.txt
Reading leases from /var/lib/dhcp/dhcpd.leases
MAC                IP              hostname       valid until         manufacturer        
===============================================================================================
b8:27:eb:3a:7c:7c  192.168.2.103   red04          2018-02-25 21:56:13 -NA-                
b8:27:eb:42:c9:e9  192.168.2.102   red01          2018-02-25 21:50:30 -NA-                
b8:27:eb:60:b8:8e  192.168.2.100   red03          2018-02-25 21:56:11 -NA-                
b8:27:eb:9a:55:13  192.168.2.101   red02          2018-02-25 21:56:12 -NA-  


 [ Error reading lock file /etc/dhcp/.dhcpd.conf.swp: Not enough data read ]

