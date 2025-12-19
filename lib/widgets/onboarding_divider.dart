import 'package:flutter/material.dart';

class OnboardingDivider extends StatelessWidget {
  const OnboardingDivider({
    super.key,
    this.textColor = const Color(0xFFD6E4E0),
    this.dividerColor = const Color(0xFFCDD1D0),
  });

  final Color textColor;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(child: Divider(color: dividerColor, thickness: 0.3)),
        Text('OR', style: TextStyle(fontSize: 14, color: textColor)),
        Expanded(child: Divider(color: dividerColor, thickness: 0.3)),
      ],
    );
  }
}
