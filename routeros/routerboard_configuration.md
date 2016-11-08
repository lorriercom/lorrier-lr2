Routerboard configuration
=========================

For Routerboard setting use **Winbox tool** (Windows users download
[here](http://www.mikrotik.com/download) on the bottom of the page. Mac OS users
download [here](http://mikrotikdownload.s3.amazonaws.com/WinBox-macOS.zip).
Detailed information about Winbox tool are
[here](http://wiki.mikrotik.com/wiki/Manual:Winbox).)

**! Please note,** default reset always disable CDP (cisco discovery protocol)
on PoE-in interface (ether1). You can enable CDP in Winbox/SSH.

 

Default configuration
---------------------

-   winbox standard port 8291, ssh standard port 22, other services disabled

-   login / password: admin / lorrier

-   cisco discovery protocol on all interfaces

-   ether1\_wan: 192.168.1.2/24, gw 192.168.1.2, DHCP client OFF

-   ether5\_local: 10.10.10.1 + DHCP server (ranges=10.10.10.2, 1 IP only)

-   Default gateway: 192.168.1.1

-   src&dst nat for arm IP address (SSH 2222 \> 22) set and disabled

-   src&dst nat for arm IP address (HTTPS 443 \> 443) set and disabled

-   src&dst nat for arm IP address (HTTP 80 \> 80) set and disabled

-   DNS services, 4 x public DNS (OpenDNS and Google public DNS)

-   NTP services, 2 x ntp.org (US, EU)

-   Wireless packages disabled (System -\> Packages: wireless-cm2 = disable,
    wireless-fp = disable)

 

### Restore default configuration

-   Download the
    [/routeros/lorrier.backup](https://github.com/lorriercom/lorrier-lr2/blob/master/routeros/)
    file

-   Login to your LR2 with Winbox and open “Files” window

-   Drag & drop the lorrier.backup file into the “Files” window

-   Click on this file to highlight it and then click on “Restore”

 

Routerboard settings instructions
---------------------------------

 

### Routerboard password change

-   System -\> Password

-   Default password: admin

 

### GW static IP address change

-   IP -\> Addresses

-   Change IP address on ether1\_wan (from default 192.168.1.2/24). IP address
    with mask format record have to be retained

-   IP -\> Routes -\> Dst. Address 0.0.0.0/0 : Set (network!) gateway IP address

 

### Dynamic IP Address enable = DHCP Client ON

-   From Winbox connect using MAC adress

-   IP -\> Addresses

-   Disable IP address on ether1\_wan (click on red cross icon)

-   IP -\> DHCP Client -\> Add; Interface = ether1\_wan; Use Peer DNS = yes; Use
    Peer NTP = yes; DHCP Options = host name + clientid; Add Default Route = yes

 

### IP access Restrictions (Recomended)

-   IP -\> Firewall -\> Adress list -\> Add; Name = allow; Address = Your
    allowed IP address(es)

-   IP -\> Firewall -\> NAT; 1. dst-nat (dst. port 2222) =\> **General:** Chain
    = dstnat; Protocol = 6 (tcp); Dst. Port = 2222. **Advanced:** Src. Address
    List = allow. **Action:** Action = dst-nat; To Address = 10.10.10.2; To
    Ports = 22

-   IP -\> Firewall -\> NAT; 2. dst-nat (dst. port 443) =\> **General:** Chain =
    dstnat; Protocol = 6 (tcp); Dst. Port = 443. **Advanced:** Src. Address List
    = allow. **Action:** Action = dst-nat; To Address = 10.10.10.2; To Ports =
    443

-   IP -\> Firewall -\> NAT; 3. dst-nat (dst. port 80) =\> **General:** Chain =
    dstnat; Protocol = 6 (tcp); Dst. Port = 80. **Advanced:** Src. Address List
    = allow. **Action:** Action = dst-nat; To Address = 10.10.10.2; To Ports =
    80

-   IP -\> Firewall -\> Filter Rules -\> Add; **General:** Chain = input;
    Protocol = 6 (tcp); Dst. Port = 22,8291,80,443. **Advanced:** Src. Address
    List = !(Not) allow. **Action:** Action = drop; To Address = 10.10.10.2; To
    Ports = 22

-   All Records (Rules, NATs, Address lists) must be enabled = not gray

 

### DNS Servers change

-   IP -\> DNS -\> Servers

-   Fill out the IP adress(es) of your desired DNS server(s)

-   Apply (OK)
