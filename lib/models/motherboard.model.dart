class Motherboard {
  final String urlImage;
  final String name;
  final String brand;
  final String socket;
  final Compatibility compatibility;
  final String url;
  final int price;

  Motherboard({
    required this.urlImage,
    required this.name,
    required this.brand,
    required this.socket,
    required this.compatibility,
    required this.url,
    required this.price,
  });

  factory Motherboard.fromJson(Map<String, dynamic> json) {
    return Motherboard(
      urlImage: json['url_image'],
      name: json['name'],
      brand: json['brand'],
      socket: json['socket'],
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: json['price']
    );
  }
}

class Compatibility {
  String ramType;
  String pciVersion;
  String cpuCompatibility;
  String gpuCompatibility;
  StorageCompatibility storageCompatibility;
  int psuPower;

  Compatibility({
    required this.ramType,
    required this.pciVersion,
    required this.cpuCompatibility,
    required this.gpuCompatibility,
    required this.storageCompatibility,
    required this.psuPower,
  });

  factory Compatibility.fromJson(Map<String, dynamic> json) {
    return Compatibility(
      ramType: json['ram_type'],
      pciVersion: json['pci_version'],
      cpuCompatibility: json['cpu_compatibility'],
      gpuCompatibility: json['gpu_compatibility'],
      storageCompatibility:
          StorageCompatibility.fromJson(json['storage_compatibility']),
      psuPower: json['psu_power'],
    );
  }
}

class StorageCompatibility {
  bool sata;
  bool nvme;

  StorageCompatibility({
    required this.sata,
    required this.nvme,
  });

  factory StorageCompatibility.fromJson(Map<String, dynamic> json) {
    return StorageCompatibility(
      sata: json['sata'],
      nvme: json['nvme'],
    );
  }
}
