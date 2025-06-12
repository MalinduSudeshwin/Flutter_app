import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  Future<void> loadItems() async {
    final data = await rootBundle.loadString('assets/items.json');
    final List<dynamic> jsonResult = json.decode(data);
    _items = jsonResult.map((e) => Item.fromJson(e)).toList();
    notifyListeners();
  }

  Item getById(int id) => _items.firstWhere((item) => item.id == id);
}
