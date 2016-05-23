# Lorrier LR2 repository

lorrier.rsc + lorrier.backup / default RouterOS (6.35.1) configuration

! Please note, defaul reset disable CDP on PoE-in interface (ether1) !

  - winbox standard port 8291, ssh standard port 22, other services disabled
  - admin / no password
  - cisco discovery protocol on all interfaces
  - ether1_wan: 192.168.1.2/24, gw 192.168.1.1
  - ether5_local: 10.10.10.1 + DHCP server (ranges=10.10.10.2, 1 IP only)
  - src&dst nat for arm IP address (SSH 2222 > 22) set and disabled
  - DNS services, 4 x public DNS (OpenDNS and Google public DNS)
  - NTP services, 2 x ntp.org (US, EU)