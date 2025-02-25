import 'responsive_utils.dart';
import 'package:flutter/material.dart';

class DeleteConfirmationPopup extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String onPopupText;

  const DeleteConfirmationPopup({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.onPopupText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UtilsResponsive.height(15, context)),
      ),
      title:  Center(
        child: Icon(
          Icons.close_rounded, // Big "X" icon
          size: UtilsResponsive.height(60, context),
          color: Colors.red[700], // Customize the color
        ),
      ),
      content:  Text(
        onPopupText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: UtilsResponsive.formatFontSize(16, context)),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton(
                onPressed: onCancel,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  textStyle: TextStyle(fontSize: UtilsResponsive.formatFontSize(16, context)),
                ),
                child: const Text('Cancel'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  textStyle: TextStyle(fontSize: UtilsResponsive.formatFontSize(16, context)),
                ),
                child: const Text('Confirm'),
              ),
            ),
          ],
        )
      ],
    );
  }
}