class RAM {
  String name;
  String brand;
  String type;
  int capacity;
  int speed;
  Compatibility compatibility;

  RAM({
    required this.name,
    required this.brand,
    required this.type,
    required this.capacity,
    required this.speed,
    required this.compatibility,
  });

  factory RAM.fromJson(Map<String, dynamic> json) {
    return RAM(
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
