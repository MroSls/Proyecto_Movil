class Motherboard {
  String url_image;
  String name;
  String brand;
  String socket;
  Compatibility compatibility;
  String url;
  int price;

  Motherboard({
    required this.url_image,
    required this.name,
    required this.brand,
    required this.socket,
    required this.compatibility,
    required this.url,
    required this.price,
  });

  factory Motherboard.fromJson(Map<String, dynamic> json) {
    return Motherboard(
      url_image: json['url_image'],
      name: json['name'],
      brand: json['brand'],
      socket: json['socket'],
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: json['price'],
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
      ramType: json['ramType'],
      pciVersion: json['pciVersion'],
      cpuCompatibility: json['cpuCompatibility'],
      gpuCompatibility: json['gpuCompatibility'],
      storageCompatibility:
          StorageCompatibility.fromJson(json['storageCompatibility']),
      psuPower: json['psuPower'],
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
