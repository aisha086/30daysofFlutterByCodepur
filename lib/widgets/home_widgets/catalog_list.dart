import 'package:catalog_project_codepur/pages/home_page_detail.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile? GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.getByPosition(index);
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog))),
              child: CatalogItem(catalog: catalog));
        })
    : ListView.builder(
    shrinkWrap: true,
    itemCount: CatalogModel.items.length,
    itemBuilder: (context, index) {
    final catalog = CatalogModel.getByPosition(index);
    return InkWell(
    onTap: () => Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => HomeDetailPage(catalog: catalog))),
    child: CatalogItem(catalog: catalog));
    });
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({super.key, required this.catalog});
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    var innerItems = [
      Hero(
          tag: Key(catalog.id.toString()),
          child: SizedBox(
              child: CatalogImage(image: catalog.image))
      ),
      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.theme.indicatorColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).bold.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog)
                ],
              ).pOnly(right: 8.0)
            ],
          ).p(context.isMobile? 0 : 20)
      )
    ];
    return VxBox(
        child: context.isMobile? Row(
      children:innerItems,
    ) : Column(
          children:innerItems,
        )
    ).color(context.cardColor).rounded.square(150).make().py12();
  }
}


