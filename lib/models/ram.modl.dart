class RAM {
  final String urlImage;
  final String name;
  final String brand;
  final String type;
  final int capacity;
  final int speed;
  final Compatibility compatibility;
  final String url;
  final int price;

  RAM({
    required this.urlImage,
    required this.name,
    required this.brand,
    required this.type,
    required this.capacity,
    required this.speed,
    required this.compatibility,
    required this.url,
    required this.price
  });

  factory RAM.fromJson(Map<String, dynamic> json) {
    return RAM(
      urlImage: json['url_image'],
      name: json['name'],
      brand: json['brand'],
      type: json['type'],
      capacity: json['capacity'],
      speed: json['speed'],
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: json['price']
    );
  }
}

class Compatibility {
  String motherboardRamType;

  Compatibility({
    required this.motherboardRamType,
  });
  factory Compatibility.fromJson(Map<String, dynamic> json) {
    return Compatibility(
      motherboardRamType: json['motherboard_ram_type'],
    );
  }
}
