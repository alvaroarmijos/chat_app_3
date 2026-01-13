import 'package:chat_app_3/app/core/ui/app_drawables.dart';
import 'package:chat_app_3/app/core/widgets/social_media_button.dart';
import 'package:chat_app_3/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            context.read<OnboardingCubit>().signUnWithGoogle();
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
