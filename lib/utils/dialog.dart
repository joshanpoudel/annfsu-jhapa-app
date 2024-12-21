import 'package:annfsu_app/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showConfirmationDialog(String text, Function() func) {
  Get.defaultDialog(
    title: 'Confirmation',
    middleText: text,
    confirm: ElevatedButton(
      onPressed: () {
        Get.back();
        func();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(GlobalColors.mainColor)),
      child: const Text('Yes', style: TextStyle(color: Colors.white)),
    ),
    cancel: TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Text(
        'No',
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}
