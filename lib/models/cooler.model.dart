class Cooler {
  final String urlImage;
  final String name;
  final String brand;
  final String type;
  final int fanSizeMm;
  final int noiseLevel;
  final Compatibility compatibility;
  final String url;
  final int price;

  Cooler({
    required this.urlImage,
    required this.name,
    required this.brand,
    required this.type,
    required this.fanSizeMm,
    required this.noiseLevel,
    required this.compatibility,
    required this.url,
    required this.price,
  });

  factory Cooler.fromJson(Map<String, dynamic> json) {
    return Cooler(
      urlImage: json['url_image'],
      name: json['name'],
      brand: json['brand'],
      type: json['type'],
      fanSizeMm: json['fan_size_mm'],
      noiseLevel: json['noise_level'],
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: json['price'],
    );
  }
}

class Compatibility {
  String cpuSocket;
  bool caseClearance;

  Compatibility({
    required this.cpuSocket,
    required this.caseClearance,
  });

  factory Compatibility.fromJson(Map<String, dynamic> json) {
    return Compatibility(
      cpuSocket: json['cpu_socket'],
      caseClearance: json['case_clearanse'],
    );
  }
}
