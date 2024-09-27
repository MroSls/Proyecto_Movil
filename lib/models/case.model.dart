class Case {
  String name;
  String brand;
  String formFactor;
  int maxGpuLengthMm;
  int maxCoolerHeightMm;
  String url;
  int price;

  Case(
      {required this.name,
      required this.brand,
      required this.formFactor,
      required this.maxGpuLengthMm,
      required this.maxCoolerHeightMm,
      required this.url,
      required this.price});

  factory Case.fromJson(Map<String, dynamic> json) {
    return Case(
      name: json['name'],
      brand: json['brand'],
      formFactor: json['formFactor'],
      maxGpuLengthMm: json['maxGpuLengthMm'],
      maxCoolerHeightMm: json['maxCoolerHeightMm'],
      url: json['url'],
      price: json['price'],
    );
  }
}
