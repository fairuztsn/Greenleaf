// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:greenleaf/config/app_colors.dart';

///Custom Alerts
class Alerts {
  ///Custom Show Alert Dialog
  static void showAlert({
    required String title,
    required String body,
    required VoidCallback onCancel,
    required VoidCallback onOk,
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(onPressed: onOk, child: const Text('Confirm')),
          TextButton(onPressed: onCancel, child: const Text('Cancel')),
        ],
      ),
    );
  }

  ///Exit Pop Up For Home Page
  static Future<bool?> showExitPopUp({required BuildContext context}) async {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Exit App?',
          style: TextStyle(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: AppColors.colorGreenLeaf,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text(
              'Yes',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: AppColors.colorGreenLeaf,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text(
              'No',
              style: TextStyle(
                color: AppColors.colorGreenLeaf,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
