# Lorrier LR2 repository

- RouterOS & ARM config files
- PCB gerber files

## Beaglebone (comes preconfigured)

### Download zipped binaries and autostart files

- Download https://lorrier.com/content/images/2016/05/lr2_debian7-v1.0.1.zip
- Unzip as /opt/lorrier
- Make symlink for autostart from /opt/lorrier/lorrier.service to /lib/systemd/system/lorrier.service
- Make second symlink for autostart from /opt/lorrier/lorrier.service to /lib/systemd/system/multi-user.target.wants/lorrier.service
- Find the kernel version (uname -a)
- For kernel 3x enable SPI bus, in /boot/uEnv.txt add cape_enable=capemgr.enable_partno=BB-SPIDEV0
- For kernel 4x enable SPI bus, in /boot/uEnv.txt add cape_enable=bone_capemgr.enable_partno=BB-SPIDEV0
- Restart (shutdown -r now)

### Quick help
- Set IP/DNS address of network server in /opt/lorrier/global_conf.json
- Optionaly set your own Gateway ID in /opt/lorrier/local_conf.json and disable auto-generated Gateway ID, in /opt/lorrier/set-gateway-id.sh set IOT_SK_GWID_UPDATE=false
- Service management: service lorrier status|start|stop|restart
- Test of proper function of LoRa RF concentrator: /opt/lorrier/test.sh

### Compile your own (basic) packet fowarder from https://github.com/Lora-net
- get the HAL driver from https://github.com/Lora-net/lora_gateway and do "make"
- get the packet forwarder from https://github.com/Lora-net/packet_forwarder and do "make"

### Compile your own (poly) packet fowarder from https://github.com/TheThingsNetwork
- get the HAL driver form https://github.com/TheThingsNetwork/lora_gateway
- channge directives "CFG_SPI= native" and "PLATFORM= lorank" in /libloragw/library.cfg and do "make"
- get the packet forwarder from https://github.com/TheThingsNetwork/packet_forwarder and do "make"

### Get your own Loriot.io binary file
- Follow instructions from Loriot.io Control Panel for Lorank8 compatible device.