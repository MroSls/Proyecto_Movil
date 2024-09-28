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
    required this.price
  });

  factory GPU.fromJson(Map<String, dynamic> json) {
    return GPU(
      url_image: json['url_image'] ?? 'default_image_url', 
      name: json['name'] ?? 'Unknown', 
      brand: json['brand'] ?? 'Unknown', 
      chipset: json['chipset'] ?? 'Unknown', 
      memory: json['memory'] ?? 'Unknown', 
      pciVersion: json['pciVersion'] ?? 'Unknown', 
      powerConsumption: json['powerConsumption'] ?? 0, 
      lengthMm: json['lengthMm'] ?? 0, 
      compatibility: Compatibility.fromJson(json['compatibility'] ?? {}), // Manejo de nulos
      url: json['url'] ?? 'https://default-url.com', 
      price: json['price'] ?? 0, 
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
      cpuCompatibility: json['cpuCompatibility'] ?? 'Unknown', 
      cpuPerformanceThreshold: json['cpuPerformanceThreshold'] ?? 'Unknown', 
    );
  }
}