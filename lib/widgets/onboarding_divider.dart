import 'package:flutter/material.dart';

class OnboardingDivider extends StatelessWidget {
  const OnboardingDivider({
    super.key,
    this.textColor = const Color(0xFFD6E4E0),
  });

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(child: Divider(color: Color(0xFFCDD1D0), thickness: 0.1)),
        Text('OR', style: TextStyle(fontSize: 14, color: textColor)),
        Expanded(child: Divider(color: Color(0xFFCDD1D0), thickness: 0.1)),
      ],
    );
  }
}
