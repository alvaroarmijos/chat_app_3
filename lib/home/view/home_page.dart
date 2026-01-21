import 'package:chat_app_3/app/auth/bloc/auth_bloc.dart';
import 'package:chat_app_3/app/core/ui/ui.dart';
import 'package:chat_app_3/app/core/widgets/chat_avatar.dart';
import 'package:chat_app_3/app/notifications/notifications_service.dart';
import 'package:chat_app_3/home/bloc/home_bloc.dart';
import 'package:chat_app_3/home/widgets/chats.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeBloc(), child: HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();

    Future.delayed(const Duration(seconds: 1), () {
      _bloc
        ..add(GetContactsEvent())
        ..add(UpdateUserStatus(status: true));
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        NotificationsService().showNotification(message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.read<AuthBloc>().state.getUser();

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: Text('Home'),
      //   leading: Icon(Icons.navigate_next),
      //   actions: [CircleAvatar()],
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
                Text(
                  'Home',
                  style: textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, AppNavigator.profile),
                  child: ChatAvatar(
                    name: user?.displayName,
                    photoUrl: user?.photoURL,
                  ),
                ),
              ],
            ),
          ),
          const Chats(),
        ],
      ),
    );
  }
}
