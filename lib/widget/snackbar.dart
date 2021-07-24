import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Snackbar {
  static void bottom(String message, [int duration = 3]) {
    Get.snackbar(
      "",
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(15.0),
      instantInit: false,
      titleText: SizedBox()
    ); 
  }

  static void info(String message, {String? title, int duration = 3}) {
    Get.snackbar(
      title ?? "",
      message,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.blue[300],
      ),
      titleText: title == null ? SizedBox() : null,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(15.0),
      duration: Duration(seconds: duration),
      reverseAnimationCurve: Curves.linear,
    ); 
  }

  static void success(String message, {String title = "Berhasil", int duration = 3}) {
    Get.snackbar(
      title,
      message,
      icon: Icon(
        Icons.check_circle,
        size: 28.0,
        color: Colors.white
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(15.0),
      duration: Duration(seconds: duration)
    ); 
  }

  static void error(String message, {String title = "Terjadi Kesalahan", int duration = 4}) {
    Get.snackbar(
      title,
      message,
      icon: Icon(
        Icons.warning,
        size: 28.0,
        color: Colors.red[300],
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(15.0),
      duration: Duration(seconds: duration),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      showProgressIndicator: true
    ); 
  }
}