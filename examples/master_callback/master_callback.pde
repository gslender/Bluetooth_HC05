#include <SoftwareSerial.h>
#include "Bluetooth_HC05.h"

SoftwareSerial bt_serial(6, 5);
Bluetooth_HC05 hc05(bt_serial);

void bluetoothDeviceFound(const BluetoothAddress &address) {
	Serial.print(F("Device Found: "));
	char address_str[HC05_ADDRESS_BUFSIZE];
	hc05.printBluetoothAddress(address_str,address,',');
	Serial.println(address_str);
}

void setup() {
	Serial.begin(115200);
	Serial.println(F("Callback HC05 Demo"));
	/* Speed: 38400; HC-05 MODE (PIO11): pin 7 */
	hc05.begin(38400, 7, HC05_MODE_COMMAND);
	/* Wait until HC-05 starts */
	delay(2000);
	/* Allow HC-05 to initiate connections */
	hc05.setRole(HC05_ROLE_MASTER);
	/* Set pwd of HC-05 to all zeros */
	hc05.setPassword("0000");
	/* Cannot connect without this */
	hc05.initSerialPortProfile();
	/* set mode, num devices and time 5 * 1.28 seconds */
	hc05.setInquiryMode(HC05_INQUIRY_RSSI, 9, 5);
	/* Inquiring does take a bit of time, thus 10 seconds of timeout. */
	hc05.inquire(bluetoothDeviceFound, 10000);
}

void loop() {
}
