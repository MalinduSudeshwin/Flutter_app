import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import '../widgets/item_tile.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final items = itemProvider.items;

    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body:
          items.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: items.length,
                itemBuilder:
                    (_, index) => ItemTile(
                      item: items[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => DetailScreen(itemId: items[index].id),
                          ),
                        );
                      },
                    ),
              ),
    );
  }
}
