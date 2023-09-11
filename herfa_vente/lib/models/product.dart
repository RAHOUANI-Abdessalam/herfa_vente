class Product {
  late final int id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final List<String> images;
  final String ownerStatus ;// ["artisant","magasin","societe","super_gros"];
  final String productStatus;
  final String details;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.images,
    required this.ownerStatus,
    required this.productStatus,
    required this.details,
  });
  
}