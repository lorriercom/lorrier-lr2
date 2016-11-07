Beaglebone (comes preconfigured)
================================

Default login: username: *root* / password: *lorrier*

### Download zipped binaries and autostart files

-   Download https://lorrier.com/content/images/2016/05/lr2\_debian7-v1.0.1.zip

-   Unzip as /opt/lorrier

-   Make symlink for autostart from /opt/lorrier/lorrier.service to
    /lib/systemd/system/lorrier.service

-   Make second symlink for autostart from /opt/lorrier/lorrier.service to
    /lib/systemd/system/multi-user.target.wants/lorrier.service

-   Find the kernel version (uname -a)

-   For kernel 3x enable SPI bus, in /boot/uEnv.txt add
    cape\_enable=capemgr.enable\_partno=BB-SPIDEV0

-   For kernel 4x enable SPI bus, in /boot/uEnv.txt add
    cape\_enable=bone\_capemgr.enable\_partno=BB-SPIDEV0

-   Restart (shutdown -r now)

### Quick help

-   Set IP/DNS address of network server in /opt/lorrier/global\_conf.json

-   Optionaly set your own Gateway ID in /opt/lorrier/local\_conf.json and
    disable auto-generated Gateway ID, in /opt/lorrier/set-gateway-id.sh set
    IOT\_SK\_GWID\_UPDATE=false

-   Service management: service lorrier status\|start\|stop\|restart

-   Test of proper function of LoRa RF concentrator: /opt/lorrier/test.sh

-   Version of the GW image: /opt/lorrier/gwVersion.txt

### Compile your own (basic) packet fowarder from https://github.com/Lora-net

-   get the HAL driver from https://github.com/Lora-net/lora\_gateway and do
    "make"

-   get the packet forwarder from https://github.com/Lora-net/packet\_forwarder
    and do "make"

### Compile your own (poly) packet fowarder from https://github.com/TheThingsNetwork

-   get the HAL driver form https://github.com/TheThingsNetwork/lora\_gateway

-   channge directives "CFG\_SPI= native" and "PLATFORM= lorank" in
    /libloragw/library.cfg and do "make"

-   get the packet forwarder from
    https://github.com/TheThingsNetwork/packet\_forwarder and do "make"

### Get your own Loriot.io binary file

-   Follow instructions from Loriot.io Control Panel for Lorrier LR2 compatible
    device.

### Installing fail2ban

-   Install aptitude: apt-get install aptitude

-   Follow fail2ban [installing
    instructions](https://www.upcloud.com/support/installing-fail2ban-on-debian-8-0/)

### Installing LoRa Gateway Bridge (brocaar)

-   Follow LoRa Gateway Bridge [installing
    instructions](https://docs.loraserver.io/lora-gateway-bridge/getting-started/#install-lora-gateway-brige)

### Installing LoRa Server (brocaar)

-   Follow LoRa Server [installing
    instructions](https://docs.loraserver.io/loraserver/getting-started/)
