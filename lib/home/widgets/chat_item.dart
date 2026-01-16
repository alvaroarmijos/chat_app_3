import 'package:chat_app_3/app/core/ui/ui.dart';
import 'package:chat_app_3/app/core/widgets/chat_avatar.dart';
import 'package:chat_app_3/domain/models/contact.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final currentStatus = switch (contact.status) {
      true => ('Online', Colors.green),
      false => ('Offline', Colors.red),
    };

    return ListTile(
      onTap: () {
        // Agregar la opción para navegar a la lista de mensajes
        Navigator.pushNamed(context, AppNavigator.chat, arguments: contact);
      },
      leading: ChatAvatar(name: contact.name, photoUrl: contact.photoUrl),
      title: Text(contact.name),
      subtitle: Text(
        currentStatus.$1,
        style: TextStyle(color: AppColors.darkGrey),
      ),
      trailing: SizedBox(
        width: 12,
        height: 12,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentStatus.$2,
          ),
        ),
      ),
    );
  }
}
