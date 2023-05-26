import 'package:flutter/material.dart';
import '../providers/items_provider.dart';

class SecondScreen extends StatelessWidget {
  final Item item;

  const SecondScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(item.name),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.imageUrl),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            Text(
              item.description,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}