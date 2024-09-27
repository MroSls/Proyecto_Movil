class Case {
  final String urlImage;
  final String name;
  final String brand;
  final String formFactor;
  final int maxGpuLengthMm;
  final int maxCoolerHeightMm;
  final String url;
  final int price;

  Case({
    required this.urlImage,
    required this.name,
    required this.brand,
    required this.formFactor,
    required this.maxGpuLengthMm,
    required this.maxCoolerHeightMm,
    required this.url,
    required this.price
  });

  factory Case.fromJson(Map<String, dynamic> json) {
    return Case(
      urlImage: json['url_image'],
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
