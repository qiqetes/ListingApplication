import 'package:flutter/material.dart';
import 'package:interview_gpt/pages/listings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Homepage'),
      floatingActionButton: IconButton(
          onPressed: () => Navigator.pushNamed(context, ListingsPage.routeName),
          icon: const Icon(Icons.send)),
    );
  }
}
