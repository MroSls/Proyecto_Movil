class Storage {
  String name;
  String brand;
  String type;
  int capacity;
  int speed;
  Compatibility compatibility;

  Storage({
    required this.name,
    required this.brand,
    required this.type,
    required this.capacity,
    required this.speed,
    required this.compatibility,
  });
  factory Storage.fromJson(Map<String, dynamic> json) {
    return Storage(
      name: json['name'],
      brand: json['brand'],
      type: json['type'],
      capacity: json['capacity'],
      speed: json['speed'],
      compatibility: Compatibility.fromJson(json['compatibility']),
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
