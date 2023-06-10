// ignore_for_file: inference_failure_on_instance_creation

import 'package:another_flushbar/flushbar.dart';
import 'package:event_app/common/utils/palette.dart';
import 'package:flutter/material.dart';

class MyFlushbar {
  static Future<dynamic> success(BuildContext context, String message) {
    return Flushbar(
      title: 'Sukses',
      duration: const Duration(seconds: 2),
      message: message,
      icon: const Icon(
        Icons.verified,
        color: Colors.white,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Palette.green,
      titleColor: Colors.white,
      messageColor: Colors.white,
    ).show(context);
  }

  static Future<dynamic> failure(BuildContext context, String message) {
    return Flushbar(
      title: 'Gagal',
      duration: const Duration(seconds: 2),
      message: message,
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Palette.red,
      titleColor: Colors.white,
      messageColor: Colors.white,
    ).show(context);
  }
}
