// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'providers/items_provider.dart';
import 'drawer/drawer.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final items = Items().items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of item'),
        actions: const [Icon(Icons.more_vert)], 
      ),
      drawer:  drawer(), 
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // Handle add button pressed
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: const EdgeInsets.all(10), 
            padding: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: ListTile(
              leading: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue, 
                ),
                child: Image.network(item.imageUrl),
              ),
              title: Text(item.name),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
              trailing: const Icon(Icons.edit), 
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemScreen(item: item),
                  ),
                );
              },
            )
          );
        },
      ),
    );
  }
}

class ItemScreen extends StatelessWidget {
  final Item item;

  const ItemScreen({required this.item});

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