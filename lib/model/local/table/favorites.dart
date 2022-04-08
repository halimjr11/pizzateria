const String tableName = "favorites";

class FavoritePizzaFields {
  static List<String> values =[
    id,name,description,deliveryTime,price,thumbnail,images
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String description = 'description';
  static const String deliveryTime = 'delivery_time';
  static const String price = 'price';
  static const String thumbnail = 'thumbnail';
  static const String images = 'images';
}

class Favorites {
  final int? id;
  final String name;
  final String description;
  final String deliveryTime;
  final String price;
  final String thumbnail;
  final String images;

  const Favorites({
    this.id,
    required this.name,
    required this.description,
    required this.deliveryTime,
    required this.price,
    required this.thumbnail,
    required this.images
  });

  static Favorites fromJson(Map<String, Object?> json) => Favorites(
      id: json[FavoritePizzaFields.id] as int?,
      name: json[FavoritePizzaFields.name] as String,
      description: json[FavoritePizzaFields.description] as String,
      deliveryTime: json[FavoritePizzaFields.deliveryTime] as String,
      price: json[FavoritePizzaFields.price] as String,
      thumbnail: json[FavoritePizzaFields.thumbnail] as String,
      images: json[FavoritePizzaFields.images] as String
  );

  Map<String, Object?> toJson() => {
    FavoritePizzaFields.id: id,
    FavoritePizzaFields.name: name,
    FavoritePizzaFields.deliveryTime: deliveryTime,
    FavoritePizzaFields.description: description,
    FavoritePizzaFields.images: images,
    FavoritePizzaFields.price: price,
    FavoritePizzaFields.thumbnail: thumbnail
  };

  Favorites copy({
    int? id,
    String? name,
    String? description,
    String? deliveryTime,
    String? price,
    String? thumbnail,
    String? images,
    
  }) => Favorites(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images
  );
}