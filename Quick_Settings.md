LR2 Quick Settings
==================

Preconfigured LR2 since version 2.1.0 is running on Debian (versions may vary)
which contains web administration environment.

 

1.  Connect your LR2 using enclosed POE adapter to your network. Default network
    setting is Static IP: 192.168.1.2

2.  Set your Routerboard password. To change Routerboard password or to change
    network setting, follow the instructions in /routeros/README.md file
    (https://github.com/lorriercom/lorrier-lr2/blob/master/routeros/README.md)

3.  Set your BBG password: Use SSH connection on port 2222 (default setting
    192.168.1.2:2222). Default login: username: *root* / password: *root*. In
    the command line type *passwd* to change your password

4.  In your web browser type *192.168.1.2* (or your LR2 IP setting) and
    authorize the safety certificate

5.  Enter your login. The default login is: username: *admin* / password:
    *admin*

6.  Set your web administration password in the Preferences window

7.  If needed, you can change your Gateway ID in the Settings/Gateway ID window

8.  Choose your Packet Forwarder or service in the Settings/Forwarder window.
    The MAC address information (primarily for Loriot.io service) can be found
    in Dashboard/Device Info. After Packet Forwarder change, you may need to
    reboot your Gateway in Dashboard window
