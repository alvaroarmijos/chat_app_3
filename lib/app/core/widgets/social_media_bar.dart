import 'package:chat_app_3/app/core/ui/app_drawables.dart';
import 'package:chat_app_3/app/core/widgets/social_media_button.dart';
import 'package:flutter/material.dart';

class SocialMediaBar extends StatelessWidget {
  const SocialMediaBar({super.key, this.appleIconColor});

  final Color? appleIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaButton(
          iconPath: AppDrawables.iconFacebook,
          onTap: () {
            print('Facebook button tapped');
          },
        ),
        SocialMediaButton(
          iconPath: AppDrawables.iconGoogle,
          onTap: () {
            print('Google button tapped');
          },
        ),
        SocialMediaButton(
          iconPath: AppDrawables.iconApple,
          onTap: () {
            print('Apple button tapped');
          },
          iconColor: appleIconColor,
        ),
      ],
    );
  }
}
