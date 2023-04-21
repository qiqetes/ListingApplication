import 'package:flutter/material.dart';
import 'package:interview_gpt/pages/home_page.dart';
import 'package:interview_gpt/pages/listings_page.dart';

void main() {
  runApp(MaterialApp(
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case HomePage.routeName:
          return MaterialPageRoute(builder: (_) => const HomePage());
        case ListingsPage.routeName:
          return MaterialPageRoute(builder: (_) => const ListingsPage());
      }
      return null;
    },
  ));
}
