import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview_gpt/bloc/chat/chat_bloc.dart';
import 'package:interview_gpt/pages/display_listings/listings_page.dart';
import 'package:interview_gpt/pages/home/home_page.dart';

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
      theme: ThemeData(
        textTheme: GoogleFonts.sourceSansProTextTheme(),
        colorScheme: const ColorScheme.dark().copyWith(
          background: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
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
