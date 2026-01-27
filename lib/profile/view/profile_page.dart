import 'package:chat_app_3/app/di/di.dart';
import 'package:chat_app_3/data/repositories/auth_repository/auth_repository.dart';
import 'package:chat_app_3/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:chat_app_3/profile/cubit/profile_cubit.dart';
import 'package:chat_app_3/profile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(getIt<AuthRepository>(), getIt<ContactsRepository>()),
      child: const ProfilePageView(),
    );
  }
}

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return switch (state) {
            ProfileStateLoading() => const SizedBox(),
            ProfileStateLoggedIn(user: final user) => ProfileView(user: user),
          };
        },
      ),
    );
  }
}
