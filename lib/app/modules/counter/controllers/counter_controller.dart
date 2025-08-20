import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var fontSize = 20.0.obs;

  void increase() {
    if (fontSize.value < 50) {
      fontSize.value += 2; // biar jelas perubahannya
    } else {
      _showSnack('STOP', 'Maksimal 50');
    }
  }

  void decrease() {
    if (fontSize.value > 2) {
      // minimal 1
      fontSize.value -= 2;
    } else {
      _showSnack('STOP', 'Minimal 2');
    }
  }

  void _showSnack(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: const Icon(Icons.warning, color: Colors.white),
    );
  }
}
