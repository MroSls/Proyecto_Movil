class Case {
  String name;
  String brand;
  String formFactor;
  int maxGpuLengthMm;
  int maxCoolerHeightMm;

  Case({
    required this.name,
    required this.brand,
    required this.formFactor,
    required this.maxGpuLengthMm,
    required this.maxCoolerHeightMm,
  });

  factory Case.fromJson(Map<String, dynamic> json) {
    return Case(
      name: json['name'],
      brand: json['brand'],
      formFactor: json['formFactor'],
      maxGpuLengthMm: json['maxGpuLengthMm'],
      maxCoolerHeightMm: json['maxCoolerHeightMm'],
    );
  }
}
