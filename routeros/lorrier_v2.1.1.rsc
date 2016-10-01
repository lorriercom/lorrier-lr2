# sep/30/2016 19:37:10 by RouterOS 6.29.1
# software id = 7RXC-ZIC2
#
/interface ethernet
set [ find default-name=ether1 ] mac-address=E4:8D:8C:D7:B4:9B name=\
    ether1_wan
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full auto-negotiation=no mac-address=\
    E4:8D:8C:D7:B4:9C
set [ find default-name=ether3 ] mac-address=E4:8D:8C:D7:B4:9D
set [ find default-name=ether4 ] mac-address=E4:8D:8C:D7:B4:9E
set [ find default-name=ether5 ] mac-address=E4:8D:8C:D7:B4:9F name=\
    ether5_local
/ip pool
add name=pool1 ranges=10.10.10.2
add name=dhcp_pool1 ranges=192.168.1.2-192.168.1.254
/ip dhcp-server
add address-pool=pool1 disabled=no interface=ether5_local name=dhcp1
/port
set 0 name=usb1
/ppp profile
set [ find name=default ] name=default
set [ find name=default-encryption ] name=default-encryption
/ip address
add address=10.10.10.1/24 interface=ether5_local network=10.10.10.0
add address=192.168.1.2/24 interface=ether1_wan network=192.168.1.0
/ip dhcp-server network
add address=10.10.10.0/24 dns-server=\
    208.67.222.222,8.8.8.8,208.67.220.220,8.8.4.4 gateway=10.10.10.1 netmask=\
    24 ntp-server=208.75.89.4,147.251.48.140
/ip dns
set servers=208.67.222.222,8.8.8.8,208.67.220.220,8.8.4.4
/ip firewall nat
add action=masquerade chain=srcnat src-address=10.10.10.0/24
add action=dst-nat chain=dstnat dst-port=2222 in-interface=ether1_wan \
    protocol=tcp to-addresses=10.10.10.2 to-ports=22
add action=dst-nat chain=dstnat dst-port=443 in-interface=ether1_wan \
    protocol=tcp to-addresses=10.10.10.2 to-ports=443
add action=dst-nat chain=dstnat dst-port=80 in-interface=ether1_wan protocol=\
    tcp to-addresses=10.10.10.2 to-ports=80
/ip hotspot user
add comment="counters and limits for trial users" name=default-trial
/ip route
add distance=1 gateway=192.168.1.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-name=Europe/Prague
/system identity
set name=Lorrier
/system ntp client
set enabled=yes primary-ntp=208.75.89.4 secondary-ntp=147.251.48.140
/system routerboard settings
set cpu-frequency=650MHz protected-routerboot=disabled
/tool netwatch
add disabled=yes down-script=\
    "/system routerboard usb power-reset duration=3s" host=10.10.10.2 \
    interval=2m
/tool romon port
add disabled=no
