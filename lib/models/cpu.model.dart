class CPU {
  final String url_image;
  final String name;
  final String brand;
  final String socket;
  final int cores;
  final int threads;
  final double clockSpeed;
  final double price;
  final Compatibility compatibility;
  final String url;

  CPU({
    required this.url_image,
    required this.name,
    required this.brand,
    required this.socket,
    required this.cores,
    required this.threads,
    required this.clockSpeed,
    required this.price,
    required this.compatibility,
    required this.url
  });

  factory CPU.fromJson(Map<String, dynamic> json) {
    return CPU(
      url_image: json['url_image'],
      name: json['name'],
      brand: json['brand'],
      socket: json['socket'],
      cores: json['cores'],
      threads: json['threads'],
      clockSpeed: (json['clock_speed'] is int)
          ? (json['clock_speed'] as int).toDouble()
          : json['clock_speed'].toDouble(),
      compatibility: Compatibility.fromJson(json['compatibility']),
      url: json['url'],
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'].toDouble()
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
