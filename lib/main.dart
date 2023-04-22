import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_gpt/bloc/chat/chat_bloc.dart';
import 'package:interview_gpt/pages/home/home_page.dart';
import 'package:interview_gpt/pages/listings_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ChatBloc(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (_) => const HomePage());
          case ListingsPage.routeName:
            return MaterialPageRoute(builder: (_) => const ListingsPage());
        }
        return null;
      },
    );
  }
}
