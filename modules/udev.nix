{ config, pkgs, ...}:
{
   services.udev = {
     packages = [ pkgs.android-udev-rules ];
     extraRules = ''
     # Atmel ATMega32U4
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2ff4", MODE:="0666"
     # Atmel USBKEY AT90USB1287
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2ffb", MODE:="0666"
     # Atmel ATMega32U2
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2ff0", MODE:="0666"
     # tmk keyboard products     https://github.com/tmk/tmk_keyboard
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="feed", MODE:="0666"
     '';
   };
}
