BBG Image Flashing Procedure
============================

There are several possibilities how to flash a new image to the BeagleBone
Green. Here we describe two of them:

### 1) microSD automatic extracting contents (not recommended for newest LR2 versions)

-   Get a 4GB or larger microSD card that is FAT formatted.

-   Make sure that the partition on the microSD card is marked as active.

    **NOTE**: To mark a partition as active in Windows 7: Open command prompt
    and enter the following commands: diskpart -\> list disk -\> select disk x
    (where x is the microSD card) -\> list partition -\> select partition 1
    (assuming the microSD card has 1 partition) -\> active.

-   Download
    [Flash\_From\_SD\_to\_eMMC.zip](https://drive.google.com/open?id=0B2d6XCsqk9PSREFxVFRpUG5MNTA)
    and extract the contents onto your microSD card.

-   Download desired image and place it onto your microSD card. The list of the
    images is in [/bbg
    configuration/bbg\_images.md](https://github.com/lorriercom/lorrier-lr2/blob/master/bbg%20configuration/bbg_images.md)
    file. Make sure there is a valid Lorrier\_LR2\_BBG\_vXXXXX.img.gz file on
    the microSD card.

-   Edit autorun.sh on your microSD card with your favorite text editor to
    replace XXXXX with your actual image number.

-   Remove the white cover of the LR2 by unscrewing four Allen screws. Eject
    microSD card from your computer, insert it into powered-off BeagleBone Green
    and apply power to your LR2.

    ![](https://abload.de/img/img_1809f2sp0.jpg)

 

-   You'll notice USR0 (the LED closest to the S1 button in the corner) will
    (after few seconds) start to blink steadily, rather than the double-pulse
    "heartbeat" pattern that is typical when your BeagleBone Green is running
    the typical Linux kernel configuration.

-   It'll run for a bit under 10 minutes and then USR0 will stay ON steady.
    That's your cue to remove power and remove the microSD card.

-   Apply power to the LR2 again, let it boot completely and check new image is
    working correctly.

*This procedure is based on “BeagleBone Black Extracting eMMC contents”:
http://elinux.org/BeagleBone\_Black\_Extracting\_eMMC\_contents*

 

### 2) BeagleBoard eMMC flasher (recommended)

-   Download desired LR2 image. The list of the images is in /bbg
    configuration/bbg\_images.md file
    (https://github.com/lorriercom/lorrier-lr2/blob/master/bbg
    configuration/bbg\_images.md).

-   Decompress Lorrier\_LR2\_BBG\_vXXXXX.img.gz file using
    [7-zip](http://www.7-zip.org/download.html).

-   Download and install [Image Writer for
    Windows](https://sourceforge.net/projects/win32diskimager/files/latest/download).
    Be sure to download the binary distribution.

-   Connect 4GB or larger microSD card into your computer.

-   Use Image Writer to write the decompressed image to your SD card.

    ![](https://beagleboard.org/static/images/write-latestimage.png)

 

-   Eject microSD card from your computer, insert it into your powered-off
    BeagleBone Green and apply power.

-   Connect to your BBG through SSH (for example using the Putty:
    http://www.putty.org/). The BBG SSH is available on port 2222. Default
    login: user= root , password= lorrier

-   In /boot/uEnv.txt:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ##enable BBB: eMMC Flasher:
    #cmdline=init=/opt/scripts/tools/eMMC/init-eMMC-flasher-v3.sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Change to:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ##enable BBB: eMMC Flasher:
    cmdline=init=/opt/scripts/tools/eMMC/init-eMMC-flasher-v3.sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Reboot the system, it'll flash the eMMC on the next bootup. When the
    flashing is complete, all 4 USRx LEDs will be steady on or off. *This can
    take up to 45 minutes.* Power-down your board, remove the SD card and apply
    power again to be complete.

 

*This procedure is based on “BeagleBoard getting started”:
https://beagleboard.org/getting-started\#update*

 

 

Troubleshooting:
----------------

-   Sometimes, after the new image is flashed, you may need to reboot LR2
    several times.
