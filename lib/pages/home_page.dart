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
      body:(CatalogModel.items.isNotEmpty)
          ?
          GridView.builder(
            padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15
              ),
              itemBuilder: (context,index){
                final item = CatalogModel.items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                    child: GridTile(
                      header: Container(
                          padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple
                        ),
                          child: Text(item.name,
                          style: const TextStyle(color: Colors.white),
                          ),
                      ),
                      footer: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            color: Colors.black
                        ),
                          child: Text(item.price.toString(),
                              style: const TextStyle(color: Colors.white)
                          ),
                      ),
                        child: Image.network(item.image),
                    ));
              },
              itemCount: CatalogModel.items.length,
          )
      // ListView.builder(
      //   padding: const EdgeInsets.all(10),
      //   itemBuilder: (context,index) => ItemWidget(item: CatalogModel.items[index]),
      //   itemCount: CatalogModel.items.length)
          :const Center(child: CircularProgressIndicator(),),
      drawer: const MyDrawer(),
    );
  }
}