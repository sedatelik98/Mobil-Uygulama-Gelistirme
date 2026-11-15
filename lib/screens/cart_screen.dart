import 'package:flutter/material.dart';

import '../models/product.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Product> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.cartItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pop(context, _items), // Güncel sepeti geri gönder
        ),
      ),
      body: _items.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Your cart is empty!",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  leading: Image.network(
                    item.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.title),
                  subtitle: Text("\$${item.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _items.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: _items.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Satın alma / Checkout simülasyonu
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Sipariş Tamamlandı"),
                      content: const Text(
                        "Ödeme simülasyonu başarıyla gerçekleşti!",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _items.clear();
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Tamam"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  "Checkout",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
    );
  }
}
