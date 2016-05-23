# may/19/2016 10:49:02 by RouterOS 6.35.1
# software id = 4BYK-42IJ
#
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    auto-negotiation=yes bandwidth=unlimited/unlimited disabled=no \
    full-duplex=yes l2mtu=1598 mac-address=E4:8D:8C:D7:B4:9B master-port=none \
    mtu=1500 name=ether1_wan orig-mac-address=E4:8D:8C:D7:B4:9B poe-out=\
    auto-on poe-priority=10 rx-flow-control=off speed=100Mbps \
    tx-flow-control=off
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full arp=enabled auto-negotiation=no \
    bandwidth=unlimited/unlimited disabled=no full-duplex=yes l2mtu=1598 \
    mac-address=E4:8D:8C:D7:B4:9C master-port=none mtu=1500 name=ether2 \
    orig-mac-address=E4:8D:8C:D7:B4:9C poe-out=auto-on poe-priority=10 \
    rx-flow-control=off speed=100Mbps tx-flow-control=off
set [ find default-name=ether3 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    auto-negotiation=yes bandwidth=unlimited/unlimited disabled=no \
    full-duplex=yes l2mtu=1598 mac-address=E4:8D:8C:D7:B4:9D master-port=none \
    mtu=1500 name=ether3 orig-mac-address=E4:8D:8C:D7:B4:9D poe-out=auto-on \
    poe-priority=10 rx-flow-control=off speed=100Mbps tx-flow-control=off
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    auto-negotiation=yes bandwidth=unlimited/unlimited disabled=no \
    full-duplex=yes l2mtu=1598 mac-address=E4:8D:8C:D7:B4:9E master-port=none \
    mtu=1500 name=ether4 orig-mac-address=E4:8D:8C:D7:B4:9E poe-out=auto-on \
    poe-priority=10 rx-flow-control=off speed=100Mbps tx-flow-control=off
set [ find default-name=ether5 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    auto-negotiation=yes bandwidth=unlimited/unlimited disabled=no \
    full-duplex=yes l2mtu=1598 mac-address=E4:8D:8C:D7:B4:9F master-port=none \
    mtu=1500 name=ether5_local orig-mac-address=E4:8D:8C:D7:B4:9F poe-out=\
    auto-on poe-priority=10 rx-flow-control=off speed=100Mbps \
    tx-flow-control=off
/ip neighbor discovery
set ether1_wan discover=yes
set ether2 discover=yes
set ether3 discover=yes
set ether4 discover=yes
set ether5_local discover=yes
/interface ethernet switch port
set 0 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
set 1 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
set 2 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
set 3 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
set 4 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
set 5 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
/ip dhcp-client option
set clientid code=61 name=clientid value="0x01\$(CLIENT_MAC)"
set hostname code=12 name=hostname value="\$(HOSTNAME)"
/ip ipsec mode-config
set (unknown) name=request-only send-dns=yes
/ip ipsec policy group
set default name=default
/ip ipsec proposal
set [ find default=yes ] auth-algorithms=sha1 disabled=no enc-algorithms=\
    aes-128-cbc lifetime=30m name=default pfs-group=modp1024
/ip pool
add name=pool1 ranges=10.10.10.2
/ip dhcp-server
add address-pool=pool1 authoritative=after-2sec-delay bootp-support=static \
    disabled=no interface=ether5_local lease-script="" lease-time=10m name=\
    dhcp1
/port
set 0 baud-rate=9600 data-bits=8 flow-control=none name=usb1 parity=none \
    stop-bits=1
/ppp profile
set *0 address-list="" !bridge !bridge-path-cost !bridge-port-priority \
    change-tcp-mss=yes !dns-server !idle-timeout !incoming-filter \
    !insert-queue-before !local-address name=default on-down="" on-up="" \
    only-one=default !outgoing-filter !parent-queue !queue-type !rate-limit \
    !remote-address !session-timeout use-compression=default use-encryption=\
    default use-mpls=default use-upnp=default !wins-server
set *FFFFFFFE address-list="" !bridge !bridge-path-cost !bridge-port-priority \
    change-tcp-mss=yes !dns-server !idle-timeout !incoming-filter \
    !insert-queue-before !local-address name=default-encryption on-down="" \
    on-up="" only-one=default !outgoing-filter !parent-queue !queue-type \
    !rate-limit !remote-address !session-timeout use-compression=default \
    use-encryption=yes use-mpls=default use-upnp=default !wins-server
/queue type
set 0 kind=pfifo name=default pfifo-limit=50
set 1 kind=pfifo name=ethernet-default pfifo-limit=50
set 2 kind=sfq name=wireless-default sfq-allot=1514 sfq-perturb=5
set 3 kind=red name=synchronous-default red-avg-packet=1000 red-burst=20 \
    red-limit=60 red-max-threshold=50 red-min-threshold=10
set 4 kind=sfq name=hotspot-default sfq-allot=1514 sfq-perturb=5
set 5 kind=pcq name=pcq-upload-default pcq-burst-rate=0 pcq-burst-threshold=0 \
    pcq-burst-time=10s pcq-classifier=src-address pcq-dst-address-mask=32 \
    pcq-dst-address6-mask=128 pcq-limit=50KiB pcq-rate=0 \
    pcq-src-address-mask=32 pcq-src-address6-mask=128 pcq-total-limit=2000KiB
set 6 kind=pcq name=pcq-download-default pcq-burst-rate=0 \
    pcq-burst-threshold=0 pcq-burst-time=10s pcq-classifier=dst-address \
    pcq-dst-address-mask=32 pcq-dst-address6-mask=128 pcq-limit=50KiB \
    pcq-rate=0 pcq-src-address-mask=32 pcq-src-address6-mask=128 \
    pcq-total-limit=2000KiB
set 7 kind=none name=only-hardware-queue
set 8 kind=mq-pfifo mq-pfifo-limit=50 name=multi-queue-ethernet-default
set 9 kind=pfifo name=default-small pfifo-limit=10
/queue interface
set ether1_wan queue=only-hardware-queue
set ether2 queue=only-hardware-queue
set ether3 queue=only-hardware-queue
set ether4 queue=only-hardware-queue
set ether5_local queue=only-hardware-queue
/routing bgp instance
set default as=65530 client-to-client-reflection=yes !cluster-id \
    !confederation disabled=no ignore-as-path-len=no name=default out-filter=\
    "" redistribute-connected=no redistribute-ospf=no redistribute-other-bgp=\
    no redistribute-rip=no redistribute-static=no router-id=0.0.0.0 \
    routing-table=""
/routing ospf instance
set [ find default=yes ] disabled=no distribute-default=never !domain-id \
    !domain-tag in-filter=ospf-in metric-bgp=auto metric-connected=20 \
    metric-default=1 metric-other-ospf=auto metric-rip=20 metric-static=20 \
    !mpls-te-area !mpls-te-router-id name=default out-filter=ospf-out \
    redistribute-bgp=no redistribute-connected=no redistribute-other-ospf=no \
    redistribute-rip=no redistribute-static=no router-id=0.0.0.0 \
    !routing-table !use-dn
/routing ospf area
set [ find default=yes ] area-id=0.0.0.0 disabled=no instance=default name=\
    backbone type=default
/snmp community
set [ find default=yes ] addresses=0.0.0.0/0 authentication-password="" \
    authentication-protocol=MD5 encryption-password="" encryption-protocol=\
    DES name=public read-access=yes security=none write-access=no
/system logging action
set 0 memory-lines=1000 memory-stop-on-full=no name=memory target=memory
set 1 disk-file-count=2 disk-file-name=log disk-lines-per-file=1000 \
    disk-stop-on-full=no name=disk target=disk
set 2 name=echo remember=yes target=echo
set 3 bsd-syslog=no name=remote remote=0.0.0.0 remote-port=514 src-address=\
    0.0.0.0 syslog-facility=daemon syslog-severity=auto syslog-time-format=\
    bsd-syslog target=remote
/user group
set read name=read policy="local,telnet,ssh,reboot,read,test,winbox,password,w\
    eb,sniff,sensitive,api,romon,!ftp,!write,!policy" skin=default
set write name=write policy="local,telnet,ssh,reboot,read,write,test,winbox,pa\
    ssword,web,sniff,sensitive,api,romon,!ftp,!policy" skin=default
set full name=full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,\
    winbox,password,web,sniff,sensitive,api,romon" skin=default
/certificate settings
set crl-download=yes
/interface bridge settings
set allow-fast-path=yes use-ip-firewall=no use-ip-firewall-for-pppoe=no \
    use-ip-firewall-for-vlan=no
/ip firewall connection tracking
set enabled=auto generic-timeout=10m icmp-timeout=10s tcp-close-timeout=10s \
    tcp-close-wait-timeout=10s tcp-established-timeout=1d \
    tcp-fin-wait-timeout=10s tcp-last-ack-timeout=10s \
    tcp-max-retrans-timeout=5m tcp-syn-received-timeout=5s \
    tcp-syn-sent-timeout=5s tcp-time-wait-timeout=10s tcp-unacked-timeout=5m \
    udp-stream-timeout=3m udp-timeout=10s
/ip neighbor discovery settings
set default=yes default-for-dynamic=no
/ip settings
set accept-redirects=no accept-source-route=no allow-fast-path=yes \
    arp-timeout=30s icmp-rate-limit=10 icmp-rate-mask=0x1818 ip-forward=yes \
    max-neighbor-entries=8192 route-cache=yes rp-filter=no secure-redirects=\
    yes send-redirects=yes tcp-syncookies=no
/interface l2tp-server server
set allow-fast-path=no authentication=pap,chap,mschap1,mschap2 \
    default-profile=default-encryption enabled=no ipsec-secret="" \
    keepalive-timeout=30 max-mru=1450 max-mtu=1450 max-sessions=unlimited \
    mrru=disabled use-ipsec=no
/interface ovpn-server server
set auth=sha1,md5 cipher=blowfish128,aes128 default-profile=default enabled=\
    no keepalive-timeout=60 mac-address=FE:9D:3D:49:AB:A0 max-mtu=1500 mode=\
    ip netmask=24 port=1194 require-client-certificate=no
/interface pptp-server server
set authentication=mschap1,mschap2 default-profile=default-encryption \
    enabled=no keepalive-timeout=30 max-mru=1450 max-mtu=1450 mrru=disabled
/interface sstp-server server
set authentication=pap,chap,mschap1,mschap2 certificate=none default-profile=\
    default enabled=no force-aes=no keepalive-timeout=60 max-mru=1500 \
    max-mtu=1500 mrru=disabled pfs=no port=443 tls-version=any \
    verify-client-certificate=no
/ip accounting
set account-local-traffic=no enabled=no threshold=256
/ip accounting web-access
set accessible-via-web=no address=0.0.0.0/0
/ip address
add address=10.10.10.1/24 disabled=no interface=ether5_local network=\
    10.10.10.0
add address=192.168.1.2/24 disabled=no interface=ether1_wan network=\
    192.168.1.0
/ip cloud
set ddns-enabled=no update-time=yes
/ip cloud advanced
set use-local-address=no
/ip dhcp-server config
set store-leases-disk=5m
/ip dhcp-server network
add address=10.10.10.0/24 caps-manager="" dhcp-option="" dns-server=\
    208.67.222.222,8.8.8.8,208.67.220.220,8.8.4.4 gateway=10.10.10.1 netmask=\
    24 ntp-server=208.75.89.4,147.251.48.140 wins-server=""
/ip dns
set allow-remote-requests=no cache-max-ttl=1w cache-size=2048KiB \
    max-udp-packet-size=4096 query-server-timeout=2s query-total-timeout=10s \
    servers=208.67.222.222,8.8.8.8,208.67.220.220,8.8.4.4
/ip firewall nat
add action=masquerade chain=srcnat !connection-bytes !connection-limit \
    !connection-mark !connection-rate !connection-type !content disabled=yes \
    !dscp !dst-address !dst-address-list !dst-address-type !dst-limit \
    !dst-port !fragment !hotspot !icmp-options !in-bridge-port !in-interface \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-interface !packet-mark \
    !packet-size !per-connection-classifier !port !priority !protocol !psd \
    !random !routing-mark !routing-table src-address=10.10.10.0/24 \
    !src-address-list !src-address-type !src-mac-address !src-port !tcp-mss \
    !time !to-addresses !to-ports !ttl
add action=dst-nat chain=dstnat !connection-bytes !connection-limit \
    !connection-mark !connection-rate !connection-type !content disabled=yes \
    !dscp !dst-address !dst-address-list !dst-address-type !dst-limit \
    dst-port=2222 !fragment !hotspot !icmp-options !in-bridge-port \
    !in-interface !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-interface !packet-mark !packet-size !per-connection-classifier !port \
    !priority protocol=tcp !psd !random !routing-mark !routing-table \
    !src-address !src-address-list !src-address-type !src-mac-address \
    !src-port !tcp-mss !time to-addresses=10.10.10.2 to-ports=22 !ttl
/ip firewall service-port
set ftp disabled=no ports=21
set tftp disabled=no ports=69
set irc disabled=no ports=6667
set h323 disabled=no
set sip disabled=no ports=5060,5061 sip-direct-media=yes sip-timeout=1h
set pptp disabled=no
/ip ipsec policy
set 0 disabled=no dst-address=::/0 group=default proposal=default protocol=\
    all src-address=::/0 template=yes
/ip proxy
set always-from-cache=no anonymous=no cache-administrator=webmaster \
    cache-hit-dscp=4 cache-on-disk=no cache-path=web-proxy enabled=no \
    max-cache-object-size=2048KiB max-cache-size=unlimited \
    max-client-connections=600 max-fresh-time=3d max-server-connections=600 \
    parent-proxy=:: parent-proxy-port=0 port=8080 serialize-connections=no \
    src-address=::
/ip route
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend !check-gateway disabled=no distance=1 \
    dst-address=0.0.0.0/0 gateway=192.168.1.1 !route-tag !routing-mark scope=\
    30 target-scope=10
/ip service
set telnet address="" disabled=yes port=23
set ftp address="" disabled=yes port=21
set www address="" disabled=yes port=80
set ssh address="" disabled=no port=22
set www-ssl address="" certificate=none disabled=yes port=443
set api address="" disabled=yes port=8728
set winbox address="" disabled=no port=8291
set api-ssl address="" certificate=none disabled=yes port=8729
/ip smb
set allow-guests=yes comment=MikrotikSMB domain=MSHOME enabled=no interfaces=\
    all
/ip smb shares
set [ find default=yes ] comment="default share" directory=/pub disabled=no \
    max-sessions=10 name=pub
/ip smb users
set [ find default=yes ] disabled=no name=guest password="" read-only=yes
/ip socks
set connection-idle-timeout=2m enabled=no max-connections=200 port=1080
/ip ssh
set always-allow-password-login=no forwarding-enabled=no strong-crypto=no
/ip traffic-flow
set active-flow-timeout=30m cache-entries=16k enabled=no \
    inactive-flow-timeout=15s interfaces=all
/ip upnp
set allow-disable-external-interface=no enabled=no show-dummy-rule=yes
/mpls
set dynamic-label-range=16-1048575 propagate-ttl=yes
/mpls interface
set [ find default=yes ] disabled=no interface=all mpls-mtu=1508
/mpls ldp
set distribute-for-default-route=no enabled=no hop-limit=255 loop-detect=no \
    lsr-id=0.0.0.0 path-vector-limit=255 transport-address=0.0.0.0 \
    use-explicit-null=no
/port firmware
set directory=firmware ignore-directip-modem=no
/ppp aaa
set accounting=yes interim-update=0s use-circuit-id-in-nas-port-id=no \
    use-radius=no
/radius incoming
set accept=no port=3799
/routing bfd interface
set [ find default=yes ] disabled=no interface=all interval=0.2s min-rx=0.2s \
    multiplier=5
/routing mme
set bidirectional-timeout=2 gateway-class=none gateway-keepalive=1m \
    gateway-selection=no-gateway origination-interval=5s preferred-gateway=\
    0.0.0.0 timeout=1m ttl=50
/routing rip
set distribute-default=never garbage-timer=2m metric-bgp=1 metric-connected=1 \
    metric-default=1 metric-ospf=1 metric-static=1 redistribute-bgp=no \
    redistribute-connected=no redistribute-ospf=no redistribute-static=no \
    routing-table=main timeout-timer=3m update-timer=30s
/snmp
set contact="" enabled=no engine-id="" location="" trap-community=public \
    trap-generators="" trap-target="" trap-version=1
/system clock
set time-zone-autodetect=yes time-zone-name=Europe/Prague
/system clock manual
set dst-delta=+00:00 dst-end="jan/01/1970 00:00:00" dst-start=\
    "jan/01/1970 00:00:00" time-zone=+00:00
/system identity
set name=Lorrier
/system leds
set 0 disabled=no interface=ether1_wan leds=led1 type=interface-activity
set 1 disabled=no interface=ether2 leds=led2 type=interface-activity
set 2 disabled=no interface=ether3 leds=led3 type=interface-activity
set 3 disabled=no interface=ether4 leds=led4 type=interface-activity
set 4 disabled=no interface=ether5_local leds=led5 type=interface-activity
set 5 disabled=no leds=wlan-led type=wireless-status
/system logging
set 0 action=memory disabled=no prefix="" topics=info
set 1 action=memory disabled=no prefix="" topics=error
set 2 action=memory disabled=no prefix="" topics=warning
set 3 action=echo disabled=no prefix="" topics=critical
/system note
set note="" show-at-login=yes
/system ntp client
set enabled=yes primary-ntp=208.75.89.4 secondary-ntp=147.251.48.140 \
    server-dns-names=""
/system resource irq
set 0 cpu=auto
set 1 cpu=auto
set 2 cpu=auto
/system routerboard settings
set boot-device=nand-if-fail-then-ethernet boot-protocol=bootp cpu-frequency=\
    650MHz force-backup-booter=no protected-routerboot=disabled silent-boot=\
    no
/system upgrade mirror
set check-interval=1d enabled=no primary-server=0.0.0.0 secondary-server=\
    0.0.0.0 user=""
/system watchdog
set auto-send-supout=no automatic-supout=yes no-ping-delay=5m watch-address=\
    none watchdog-timer=yes
/tool bandwidth-server
set allocate-udp-ports-from=2000 authenticate=yes enabled=yes max-sessions=\
    100
/tool e-mail
set address=0.0.0.0 from=<> password="" port=25 start-tls=no user=""
/tool graphing
set page-refresh=300 store-every=5min
/tool mac-server
set [ find default=yes ] disabled=no interface=all
/tool mac-server mac-winbox
set [ find default=yes ] disabled=no interface=all
/tool mac-server ping
set enabled=yes
/tool netwatch
add disabled=yes down-script=\
    "/system routerboard usb power-reset duration=3s" host=10.10.10.2 \
    interval=2m timeout=1s up-script=""
/tool romon
set enabled=no id=00:00:00:00:00:00 secrets=""
/tool romon port
set [ find default=yes ] cost=100 disabled=no forbid=no interface=all \
    secrets=""
/tool sms
set allowed-number="" channel=0 keep-max-sms=0 receive-enabled=no secret="" \
    sim-pin=""
/tool sniffer
set file-limit=1000KiB file-name="" filter-cpu="" filter-direction=any \
    filter-interface="" filter-ip-address="" filter-ip-protocol="" \
    filter-ipv6-address="" filter-mac-address="" filter-mac-protocol="" \
    filter-operator-between-entries=or filter-port="" filter-stream=no \
    memory-limit=100KiB memory-scroll=yes only-headers=no streaming-enabled=\
    no streaming-server=0.0.0.0
/tool traffic-generator
set latency-distribution-max=100us measure-out-of-order=yes \
    stats-samples-to-keep=100 test-id=0
/user aaa
set accounting=yes default-group=read exclude-groups="" interim-update=0s \
    use-radius=no
