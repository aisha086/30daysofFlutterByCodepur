import 'dart:convert';

import 'package:catalog_project_codepur/models/catalog.dart';
import 'package:catalog_project_codepur/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/themes.dart';

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
      backgroundColor: MyTheme.creamColor,
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         Navigator.pushNamed(context, MyRoutes.cartPageRoute);
       },
       backgroundColor: MyTheme.darkBluishColor,
       child: const Icon(CupertinoIcons.cart),
     ),
     body: SafeArea(child: Container(
       padding: Vx.m24,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const CatalogHeader(),
           if(CatalogModel.items.isNotEmpty)
             const CatalogList().pOnly(top: 10,bottom: 10).expand()
           else
             const Center(child: CircularProgressIndicator(),).expand()
         ],
       ),
     )),
    );
  }
}










