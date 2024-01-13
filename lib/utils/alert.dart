import 'package:flutter/material.dart';

class Alerts{
  static void showAlert(
      {required String title,
      required String body,
      required VoidCallback onCancel,
      required VoidCallback onOk,
      required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
              ),actions: [
                TextButton(onPressed: onOk, child: const Text("Confirm")),
                TextButton(onPressed: onCancel, child: const Text("Cancel")),
              ],
            ));
    }
}