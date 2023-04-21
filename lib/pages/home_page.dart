import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Text('Busca un ranking o listado de lo que quieras'),
          const Expanded(
            child: Center(child: Text("El chat aquí")),
          ),
          TextField(
            controller: _controller,
          )
        ]),
      ),
      floatingActionButton: IconButton(
          onPressed: () => Navigator.pushNamed(context, ListingsPage.routeName),
          icon: const Icon(Icons.send)),
    );
  }
}
