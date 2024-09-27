class CPU {
  String name;
  String brand;
  String socket;
  int cores;
  int threads;
  double clockSpeed;
  double price;
  Compatibility compatibility;

  CPU({
    required this.name,
    required this.brand,
    required this.socket,
    required this.cores,
    required this.threads,
    required this.clockSpeed,
    required this.price,
    required this.compatibility,
  });

  factory CPU.fromJson(Map<String, dynamic> json) {
    return CPU(
      name: json['name'],
      brand: json['brand'],
      socket: json['socket'],
      cores: json['cores'],
      threads: json['threads'],
      clockSpeed: (json['clock_speed'] is int)
          ? (json['clock_speed'] as int).toDouble()
          : json['clock_speed'].toDouble(),
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'].toDouble(),
      compatibility: Compatibility.fromJson(json['compatibility']),
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
      gpuPerformanceThreshold: (json['gpu_performance_threshold'] is int)
          ? (json['gpu_performance_threshold'] as int).toDouble()
          : json['gpu_performance_threshold'].toDouble(),
    );
  }
}
