import 'package:flutter/material.dart';

class GreenButtonWidget extends StatelessWidget {
  final VoidCallback onPressButton;
  final String text;
  final Icon? icon;
  const GreenButtonWidget({super.key, required this.onPressButton, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressButton,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[600],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            const SizedBox(width: 8),
            icon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
