import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExitAppUtil {
  static DateTime? _lastPressed;

  static bool handlePopInvoked() {
    final now = DateTime.now();
    if (_lastPressed == null ||
        now.difference(_lastPressed!) > const Duration(seconds: 2)) {
      _lastPressed = now;
      Fluttertoast.showToast(
        msg: "Tekan sekali lagi untuk keluar",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return false; // jangan keluar dulu
    }
    return true; // keluar aplikasi
  }
}
