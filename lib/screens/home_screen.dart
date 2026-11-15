import 'package:flutter/material.dart';

import '../models/product.dart';
import 'detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> cart = []; // Basit sepet listesi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discover",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () async {
              // Sepet sayfasına git ve dönen güncel sepeti al
              final updatedCart = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: cart),
                ),
              );
              if (updatedCart != null) {
                setState(() {
                  cart.clear();
                  cart.addAll(updatedCart);
                });
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Arama Kutusu
            TextField(
              decoration: InputDecoration(
                hintText: "Search any product device",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),

            // Banner Alanı (Rapordaki görsele referans)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "GIFT STORE",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Get your special gifts with discounts!",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.card_giftcard,
                    size: 50,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // GridView Ürün Listesi
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Product.sampleProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final product = Product.sampleProducts[index];
                return GestureDetector(
                  onTap: () async {
                    // Ürün detay sayfasına git ve sepete eklendiyse ürünü al
                    final addedProduct = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(product: product),
                      ),
                    );
                    if (addedProduct != null && addedProduct is Product) {
                      setState(() {
                        cart.add(addedProduct);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${addedProduct.title} sepete eklendi!",
                          ),
                        ),
                      );
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              product.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "\$${product.price}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
