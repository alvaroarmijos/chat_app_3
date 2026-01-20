import 'package:chat_app_3/chat/bloc/chat_bloc.dart';
import 'package:chat_app_3/chat/widgets/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({
    super.key,
    required this.contactId,
    required this.contactName,
  });

  final String contactId;
  final String contactName;

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(GetMessagesEvent(contactId: widget.contactId));
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state.messages.isEmpty) return;

        SchedulerBinding.instance.addPostFrameCallback((_) {
          // _scrollController.animateTo(
          //   _scrollController.position.maxScrollExtent,
          //   duration: Duration(milliseconds: 300),
          //   curve: Curves.easeIn,
          // );
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        });
      },
      builder: (context, state) {
        final messages = state.messages;

        if (messages.isEmpty) {
          return Center(child: const Text("No messages yet.."));
        }

        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 100),
          itemBuilder: (context, index) {
            return MessageTile(
              mySelf: messages[index].sentBy != widget.contactId,
              userName: widget.contactName,
              msg: messages[index].message,
              date: messages[index].date,
            );
          },
          itemCount: messages.length,
        );
      },
    );
  }
}
