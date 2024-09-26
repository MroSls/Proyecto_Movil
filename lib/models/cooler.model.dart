class Cooler {
  String name;
  String brand;
  String type;
  int fanSizeMm;
  int noiseLevel;
  Compatibility compatibility;

  Cooler({
    required this.name,
    required this.brand,
    required this.type,
    required this.fanSizeMm,
    required this.noiseLevel,
    required this.compatibility,
  });

  factory Cooler.fromJson(Map<String, dynamic> json) {
    return Cooler(
      name: json['name'],
      brand: json['brand'],
      type: json['type'],
      fanSizeMm: json['fanSizeMm'],
      noiseLevel: json['noiseLevel'],
      compatibility: Compatibility.fromJson(json['compatibility']),
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
