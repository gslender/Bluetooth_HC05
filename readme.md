# Bluetooth HC05 Arduino Library 

A fork of the work originally done by Artem Borisovskiy (bytefu@gmail.com), http://robocraft.ru

I've updated with a few minor tweaks and fixes.

Library is designed for HC-05 bluetooth module with Arduino. It saves yor time by abstracting you from AT-commands, which control the module, with class Bluetooth_HC05 and it's methods. Of course it adds some overhead to your firmware, but it's the price you pay for great convinience of getting the things done with several method calls rather than writing a parser for large AT-command set.
