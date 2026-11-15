class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  // Rapordaki simülasyon verileri
  static List<Product> sampleProducts = [
    Product(
      id: 1,
      title: "AirPods Pro (2nd Gen)",
      price: 249.0,
      description: "Rich audio quality, active noise cancellation, and adaptive transparency.",
      imageUrl:
          "https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=500",
    ),
    Product(
      id: 2,
      title: "AirPods Max",
      price: 549.0,
      description:
          "Over-ear headphone designed for ultimate high-fidelity audio.",
      imageUrl:
          "https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=500",
    ),
    Product(
      id: 3,
      title: "HomePod Mini",
      price: 99.0,
      description:
          "Room-filling sound, intelligent assistant, and smart home control.",
      imageUrl:
          "https://images.unsplash.com/photo-1543512214-318c7553f230?w=500",
    ),
    Product(
      id: 4,
      title: "MacBook Pro 14\"",
      price: 1999.0,
      description: "Supercharged by M-series chips for advanced workflows and performance.",
      imageUrl:
          "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500",
    ),
  ];
}
