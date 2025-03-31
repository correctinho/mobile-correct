import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';

class ToastErrorWidget extends StatelessWidget {
  const ToastErrorWidget({super.key, required this.messageError});
  final String messageError;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
        child: Row(
          children: [
            const Icon(
              Icons.cancel_outlined,
              color: CustomColors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Text(
                messageError,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
      duration: const Duration(milliseconds: 1700),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
