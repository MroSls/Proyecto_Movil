class GPU {
  final String urlImage;
  final String name;
  final String brand;
  final String chipset;
  final String memory;
  final String pciVersion;
  final int powerConsumption;
  final int lengthMm;
  final Compatibility compatibility;
  final String url;
  final int price;

  GPU({
    required this.urlImage,
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
      urlImage: json['url_image'],
      name: json['name'],
      brand: json['brand'],
      chipset: json['chipset'],
      memory: json['memory'],
      pciVersion: json['pci_version'],
      powerConsumption: json['power_consumption'],
      lengthMm: json['length_mm'],
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: json['url_image'],
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
      cpuCompatibility: json['cpu_compatibility'],
      cpuPerformanceThreshold: json['cpu_performance_threshold'],
    );
  }
}
