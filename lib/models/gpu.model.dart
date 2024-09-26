class GPU {
  String name;
  String brand;
  String chipset;
  String memory;
  String pciVersion;
  int powerConsumption;
  int lengthMm;
  Compatibility compatibility;

  GPU({
    required this.name,
    required this.brand,
    required this.chipset,
    required this.memory,
    required this.pciVersion,
    required this.powerConsumption,
    required this.lengthMm,
    required this.compatibility,
  });
  factory GPU.fromJson(Map<String, dynamic> json) {
    return GPU(
      name: json['name'],
      brand: json['brand'],
      chipset: json['chipset'],
      memory: json['memory'],
      pciVersion: json['pciVersion'],
      powerConsumption: json['powerConsumption'],
      lengthMm: json['lengthMm'],
      compatibility: Compatibility.fromJson(json['compatibility']),
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
