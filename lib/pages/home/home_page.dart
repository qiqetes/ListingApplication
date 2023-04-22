import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_gpt/bloc/chat_bloc.dart';
import 'package:interview_gpt/bloc/chat_events.dart';
import 'package:interview_gpt/bloc/chat_states.dart';
import 'package:interview_gpt/pages/home/chat_component.dart';
import 'package:interview_gpt/pages/listings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller =
      TextEditingController(text: "Tu texto aquí");

  late final StreamSubscription chatStreamSubscription;
  @override
  void initState() {
    super.initState();
    chatStreamSubscription = context.read<ChatBloc>().stream.listen((state) {
      if (state is ChatStateWithListing) {
        Navigator.pushNamed(context, ListingsPage.routeName);
      }
    });
  }

  @override
  void dispose() {
    chatStreamSubscription.cancel();
    super.dispose();
  }

  void onPress() {
    context.read<ChatBloc>().add(ChatEventSend(message: _controller.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Text('Busca un ranking o listado de lo que quieras'),
              const ChatUI(),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: TextField(controller: _controller)),
                  BlocBuilder<ChatBloc, ChatState>(
                    builder: (_, state) {
                      return IconButton(
                          onPressed: state is ChatStateLoading ? null : onPress,
                          icon: const Icon(Icons.send));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
