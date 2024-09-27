class PSU {
  String name;
  String brand;
  int wattage;
  String efficiencyRating;
  bool modular;
  Compatibility compatibility;
  String url;
  int price;

  PSU({
    required this.name,
    required this.brand,
    required this.wattage,
    required this.efficiencyRating,
    required this.modular,
    required this.compatibility,
    required this.url,
    required this.price,
  });
  factory PSU.fromJson(Map<String, dynamic> json) {
    return PSU(
      name: json['name'],
      brand: json['brand'],
      wattage: json['wattage'],
      efficiencyRating: json['efficiency_rating'],
      modular: json['modular'],
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: json['price'],
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
