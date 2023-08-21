import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

//Day 10 learnt about context,constraints

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog App"),
      ),
      body: const Center(
        child: Text('Day 10 learnt about context and constraints'),
      ),
      drawer: MyDrawer(),
    );
  }
}