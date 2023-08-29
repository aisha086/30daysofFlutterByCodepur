import 'dart:convert';

import 'package:catalog_project_codepur/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData()async{
    await Future.delayed(const Duration(seconds: 5));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    final productData = decodeData["products"];
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Catalog App"),
      ),
      body:(CatalogModel.items.isNotEmpty)? ListView.builder(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context,index) => ItemWidget(item: CatalogModel.items[index]),
        itemCount: CatalogModel.items.length):Center(child: CircularProgressIndicator(),),
      drawer: const MyDrawer(),
    );
  }
}