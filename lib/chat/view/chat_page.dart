import 'package:chat_app_3/chat/bloc/chat_bloc.dart';
import 'package:chat_app_3/chat/widgets/widgets.dart';
import 'package:chat_app_3/domain/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ChatBloc(), child: ChatPageView());
  }
}

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        title: ChatAppBarTitle(
          contact: Contact(
            name: contact.name,
            status: true,
            id: contact.id,
            photoUrl: contact.photoUrl,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Lista de mensajes

          // Widget
          ChatTextFormField(contactId: contact.id),
        ],
      ),
    );
  }
}
