import 'package:codelab6_belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, imageUrl: 'assets/images/sugar.jpg', stock: 100, rating: 4.5),
    Item(name: 'Salt', price: 2000, imageUrl: 'assets/images/salt.jpg', stock: 50, rating: 4.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Barang Belanja'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/item',
                      arguments: item,
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Hero(
                          tag: item.name,
                          child: Image.asset(item.imageUrl, fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text('Rp ${item.price}', style: const TextStyle(color: Colors.black)),
                        Text('Stok: ${item.stock}', style: const TextStyle(color: Colors.black)),
                        Text('Rating: ${item.rating}', style: const TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text(
                'Sofi Lailatul Aniftasari - NIM: 2241760073',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}