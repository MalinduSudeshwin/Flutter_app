import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';

class DetailScreen extends StatelessWidget {
  final int itemId;
  const DetailScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ItemProvider>(
      context,
      listen: false,
    ).getById(itemId);

    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Optional: Placeholder Image
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.fastfood,
                    size: 80,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
