Lorrier LR2 repository
======================

-   RouterOS & ARM config files

-   PCB gerber files

-   Web administration files

-   Settings instructions

 

LR2 Gateway (comes preconfigured)
---------------------------------

 

### Quick Settings

-   Follow instructions in
    [LR2_Quick_Settings.md](https://github.com/lorriercom/lorrier-lr2/blob/master/LR2_Quick_Settings.md)
    file

-   That instructions are enough for LR2 complete easy settings

 

### LR2 Gateway consist of this 3 parts:

-   Mikrotik Routerboard RB951Ui-2nD (https://routerboard.com/RB951Ui-2nD)

-   SeedStudio BeagleBone Green (https://beagleboard.org/green)

-   IMST iC880A
    (http://www.wireless-solutions.de/products/long-range-radio/ic880a.html)

 

### Routeroard

-   Routerboard configuration in
    [/routeros/routerboard_configuration.md](https://github.com/lorriercom/lorrier-lr2/blob/master/routeros/routerboard_configuration.md)
    file.

-   Routeros backup files: /routeros/lorrier.rsc and /routeros/lorrier.backup

 

### BeagleBone Green (BBG)

-   BBG configuration in [/bbg
    configuration/bbg_configuration.md](https://github.com/lorriercom/lorrier-lr2/tree/master/bbg%20configuration/bbg_configuration.md)
    file.

-   You can update your BBG by latest image. Image flashing instructions are in
    [/bbg
    configuration/bbg_flashing.md](https://github.com/lorriercom/lorrier-lr2/tree/master/bbg%20configuration/bbg_flashing.md)
    file. Be sure you have also the Routerboard updated by latest backup file.

-   LR2 Images download in [/bbg
    configuration/bbg_images.md](https://github.com/lorriercom/lorrier-lr2/tree/master/bbg%20configuration/bbg_images.md)
    file.

 

LR2 Gateway troubleshooting
---------------------------

 

### BeagleBone freezing (occurred in isolated cases)

**Issue:** BBG freezes from time to time, ie. it stops responding after some
time in service. BBG system apparently freezes and GW stops receiving and
sending payload. The BBG cannot be communicated, web administration is not
available. The other GW systems (Routerboard) are in normal use.

**Cause of the problem:** LR2 IoT concentrator consists of a BBG + IC880a
tandem. This whole system is powered by USB-UART converter, which is connected
to USB port of Mikrotik Routerboard. Under certain circumstances, especially
when transmission from the IC880a is initiated, the peak consumption of BBG +
IC880a tandem is greater than the maximum consumption threshold of some chips
used for the USB-UART converter in LR2 (eg FTDI FT232RL). In this case, some
USB-UART chips can initiate a PWREN \# sequence to check the power consumption
of the connected devices. Some external logic has the ability to power itself
down into a low current state by monitoring the PWREN\# signal. For external
logic that cannot power itself down in this way, those chips provides a simple
but effective method of turning off power during the USB suspend mode. When this
happens in LR2, the BBG gets a shutdown command and turns off. Alternatively,
the power supply for BBG + IC880a tandem from the USB-UART converter is turned
off.

**Solution:**

There are two possibilities to solve this problem:

a) replace an existing USB-UART converter that feeds BBG + IC880a with another
type that has a maximum power threshold set to a higher level. Replacing the
USB-UART converter is very simple and inexpensive.

  
b) use a simple USB Pin Header cable instead of a USB-UART converter. Since USB
is only used for power (other features using TX and RX connectors have not yet
been used in LR2), it is only possible to use power connectors (VCC + 5V and
GND) directly from USB.

 

Note: For both cases, the LR2 top cover must be removed of course. No effort is
needed to eject the USB-UART converter. On the RouterBoard side, just pull out
the USB connector. On the BBG + IC880a side, the connectors are inserted into
the pins on the Lorrier Bl PCB (Lora Adapter) and secured with a drop of glue
from the melt gun. It needs to be loosened and the individual connectors pinned
out gently. When replacing with a new USB-UART converter or USB pin Header cable
it is necessary to keep the correct polarity!

 

 

### Lorrier.com not responding

The Lorrier company changed its ownership structure and disappeared as a
manufacturer of IoT devices in 2019. However, this does not change the
functionality and support of existing LR2 gateways, as the entire system is
released as open-source and fully customizable by the user. All support
documents and materials are posted on Lorrier github.
