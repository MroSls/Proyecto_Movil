class PSU {
  final String urlImage;
  final String name;
  final String brand;
  final int wattage;
  final String efficiencyRating;
  final bool modular;
  final Compatibility compatibility;
  final String url;
  final int price;

  PSU({
    required this.urlImage,
    required this.name,
    required this.brand,
    required this.wattage,
    required this.efficiencyRating,
    required this.modular,
    required this.compatibility,
    required this.url,
    required this.price
  });

  factory PSU.fromJson(Map<String, dynamic> json) {
    return PSU(
      urlImage: json['url_image'],
      name: json['name'],
      brand: json['brand'],
      wattage: json['wattage'],
      efficiencyRating: json['efficiency_rating'],
      modular: json['modular'],
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: json['price']
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
