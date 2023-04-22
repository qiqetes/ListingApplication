import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_gpt/bloc/chat/chat_bloc.dart';
import 'package:interview_gpt/bloc/chat/chat_states.dart';

import 'package:interview_gpt/pages/home/chat_component.dart';
import 'package:interview_gpt/pages/display_listings/listings_page.dart';
import 'package:interview_gpt/pages/home/presentation_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: const [Presentation(), ChatUI()],
          ),
        ),
      ),
    );
  }
}
