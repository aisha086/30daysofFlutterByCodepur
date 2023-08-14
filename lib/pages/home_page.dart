import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: const Center(
        child: Text('30 Days of flutter'),
      ),
      drawer: Drawer(),
    );
  }
}
