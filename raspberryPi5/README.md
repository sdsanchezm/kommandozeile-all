# Raspberry pi 5 - 8GB work log

## no hdmi sound
- fix: [https://forums.raspberrypi.com/viewtopic.php?t=383491]
- steps
    - `sudo apt install pipewire` (it is not installed by default in the Rpi5
    - `sudo raspi-config` then 6, then A7 (System Tools and Audio Settings, select use pipewire)
    -  might be required to restart
