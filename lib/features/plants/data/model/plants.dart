class Plants {
  final int id;
  final int categoryId;
  final String imageUrl;
  final String name;
  final double rating;
  final int displaySize;
  final List<int> availableSize;
  final String unit;
  final String price;
  final String priceUnit;
  final String description;

  Plants({
    required this.id,
    required this.categoryId,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.displaySize,
    required this.availableSize,
    required this.unit,
    required this.price,
    required this.priceUnit,
    required this.description,
  });

  factory Plants.fromMap(Map<String, dynamic> map) {
    return Plants(
      id: (map['id'] ?? 0) as int,
      categoryId: (map['categoryId'] ?? 0) as int,
      imageUrl: (map['image_url'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      rating: (map['rating'] is int)
          ? (map['rating'] as int).toDouble()
          : map['rating'],
      displaySize: (map['display_size'] ?? 0) as int,
      availableSize: (map['available_size'] as List<dynamic>?)
              ?.map((item) => item is int ? item : int.parse(item.toString()))
              .toList() ??
          const <int>[],
      unit: (map['unit'] ?? '') as String,
      price: (map['price'] ?? '') as String,
      priceUnit: (map['price_unit'] ?? '') as String,
      description: (map['description'] ?? '') as String,
    );
  }
}
