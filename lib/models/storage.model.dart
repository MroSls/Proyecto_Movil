class Storage {
  String name;
  String brand;
  String type;
  int capacity;
  int speed;
  Compatibility compatibility;
  String url;
  int price;

  Storage({
    required this.name,
    required this.brand,
    required this.type,
    required this.capacity,
    required this.speed,
    required this.compatibility,
    required this.url,
    required this.price,
  });
  factory Storage.fromJson(Map<String, dynamic> json) {
    return Storage(
      name: json['name'],
      brand: json['brand'],
      type: json['type'],
      capacity: json['capacity'],
      speed: json['speed'],
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: json['price'],
    );
  }
}

class Compatibility {
  String motherboardStorageType;

  Compatibility({
    required this.motherboardStorageType,
  });

  factory Compatibility.fromJson(Map<String, dynamic> json) {
    return Compatibility(
      motherboardStorageType: json['motherboard_storage_type'],
    );
  }
}
