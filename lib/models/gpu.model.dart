class GPU {
  String url_image;
  String name;
  String brand;
  String chipset;
  String memory;
  String pciVersion;
  int powerConsumption;
  int lengthMm;
  Compatibility compatibility;
  String url;
  int price;
  GPU({
    required this.url_image,
    required this.name,
    required this.brand,
    required this.chipset,
    required this.memory,
    required this.pciVersion,
    required this.powerConsumption,
    required this.lengthMm,
    required this.compatibility,
    required this.url,
    required this.price,
  });
  factory GPU.fromJson(Map<String, dynamic> json) {
    return GPU(
      url_image: json['url_image'],
      name: json['name'],
      brand: json['brand'],
      chipset: json['chipset'],
      memory: json['memory'],
      pciVersion: json['pciVersion'],
      powerConsumption: json['powerConsumption'],
      lengthMm: json['lengthMm'],
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: json['price'],
    );
  }
}

class Compatibility {
  String cpuCompatibility;
  String cpuPerformanceThreshold;

  Compatibility({
    required this.cpuCompatibility,
    required this.cpuPerformanceThreshold,
  });
  factory Compatibility.fromJson(Map<String, dynamic> json) {
    return Compatibility(
      cpuCompatibility: json['cpuCompatibility'],
      cpuPerformanceThreshold: json['cpuPerformanceThreshold'],
    );
  }
}
