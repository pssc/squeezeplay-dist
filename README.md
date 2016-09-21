* Warning Beta *
=================
Squeezeplay Pi Packages from:-

https://github.com/pssc/squeezeplay

Install
-------

Instructions to add squeezeplay reopo and install for raspbian.  Fragments should be copy paste.

*** Update to fix fetch over https ***

```bash
cd /etc/apt/sources.list.d/
cat <<EOF >squeezeplay.list
deb [ trusted=yes ] http://pssc.github.io/squeezeplay-dist squeezeplay contrib
EOF

apt-get update
apt-get install squeezeplay

```
This install is configured by default to work best with the Offical Pi Screen.  Other screens tested
Including Mimio 720S, adtafruitrt2.8, adafruit3.5 and TonTec3.5
Support for WaveShare Based touch Screens (by ZH851) 7 and 5in. (waveshare raw input driver in ts.conf)

Audo support for both for internal and External Devices (Settings->Advanced->Advanced Audio->Enable) reboot Select Device.  
Tested, Behenger UCA202,Pi-DAC+ and SMSL M2

RPi Offical LCD Touch Screen
----------------------------
```
ln -s /opt/squeezeplay/etc/udev/rules.d/95-rpi-lcd.rules /etc/udev/rules.d/95-rpi-lcd.rules
```

Other TS
--------

you will need to run squeezplay on the console first having setup your ts to appear as /dev/input/touchscreen
see examples in /opt/squeezeplat/etc/udev/rules.d for this... This is so tslib can clibrate for the screen...
remembering to chamge mode to the resoltion of your touch screen skin. FIXME fbcp needed for skin/HW resolution mismatches.

Systemd Auto start
------------------

This calls /opt/squeezeplay/bin/squeezplay-touch.sh

```
ln -s /opt/squeezeplay/etc/systemd/system/squeezeplay.service /etc/systemd/system/multi-user.target.wants/squeezeplay.service
systemctl restart squeezeplay
```
