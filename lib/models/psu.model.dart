class PSU {
  String name;
  String brand;
  int wattage;
  String efficiencyRating;
  bool modular;
  Compatibility compatibility;

  PSU({
    required this.name,
    required this.brand,
    required this.wattage,
    required this.efficiencyRating,
    required this.modular,
    required this.compatibility,
  });
  factory PSU.fromJson(Map<String, dynamic> json) {
    return PSU(
      name: json['name'],
      brand: json['brand'],
      wattage: json['wattage'],
      efficiencyRating: json['efficiency_rating'],
      modular: json['modular'],
      compatibility: Compatibility.fromJson(json['compatibility']),
    );
  }
}

class Compatibility {
  int requiredPower;

  Compatibility({
    required this.requiredPower,
  });

  factory Compatibility.fromJson(Map<String, dynamic> json) {
    return Compatibility(
      requiredPower: json['required_power'],
    );
  }
}
