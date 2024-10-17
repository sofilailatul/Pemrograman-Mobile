import 'package:codelab6_belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item.name,
              child: Image.asset(item.imageUrl),
            ),
            const SizedBox(height: 16),
            Text(
              'Nama: ${item.name}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Harga: Rp ${item.price}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Stok: ${item.stock}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Rating: ${item.rating}', style: const TextStyle(fontSize: 20)),
            const  SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}