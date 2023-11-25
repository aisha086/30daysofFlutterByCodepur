import 'package:catalog_project_codepur/models/catalog.dart';

class CartModel{

  //catalog fields
  late  CatalogModel _catalog;

  //Collections of ids - store ids of each item
  final List<int> _itemIds = [];

  //Get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item){
    _itemIds.add(item.id);
  }

  //Remove item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}