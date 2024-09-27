class CPU {
  String name;
  String brand;
  String socket;
  int cores;
  int threads;
  double clockSpeed;
  Compatibility compatibility;
  String url;
  int price;

  CPU({
    required this.name,
    required this.brand,
    required this.socket,
    required this.cores,
    required this.threads,
    required this.clockSpeed,
    required this.compatibility,
    required this.url,
    required this.price,
  });

  factory CPU.fromJson(Map<String, dynamic> json) {
    return CPU(
      name: json['name'],
      brand: json['brand'],
      socket: json['socket'],
      cores: json['cores'],
      threads: json['threads'],
      clockSpeed: json['clock_speed'],
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: json['price'],
    );
  }
}

class Compatibility {
  String motherboardSocket;
  double gpuPerformanceThreshold;

  Compatibility({
    required this.motherboardSocket,
    required this.gpuPerformanceThreshold,
  });

  factory Compatibility.fromJson(Map<String, dynamic> json) {
    return Compatibility(
      motherboardSocket: json['motherboard_socket'],
      gpuPerformanceThreshold: json['gpu_performance_threshold'],
    );
  }
}
