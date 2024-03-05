class CarsModel {
  final String uuid;
  final double price;
  final  String carModel;
  final List<String> carPics;
  final String description;
  final int establishedYear;
  final String logo;

  CarsModel({
    required this.uuid,
    required this.price,
    required this.carModel,
    required this.carPics,
    required this.description,
    required this.establishedYear,
    required this.logo,
});

  factory CarsModel.fromJson(Map<String, dynamic> json) {
    return CarsModel(
      uuid: json['_uuid'] as String ?? '',
      price: (json['average_price'] as num? ?? 0.0).toDouble() ,
      carModel: json['car_model'] as String? ?? '',
      carPics: (json['car_pics'] as List?)?.map((e) => e.toString()).toList()??[],
      description: json['description'] as String ?? '',
      establishedYear: json['established_year'] as int? ?? 0,
      logo: json['logo'] as String ?? '',
    );
  }
}