import 'dart:io';

bool isConnected = false;
bool isCheckingConnection = true;

Future<void> checkConnectivity() async {
  isCheckingConnection = true;

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      isConnected = true;
    } else {
      isConnected = false;
    }
  } on SocketException catch (_) {
    isConnected = false;
  } finally {
    isCheckingConnection = false;
  }
}