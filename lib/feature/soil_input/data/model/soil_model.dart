class SoilResultModel {
  final String crop;

  SoilResultModel({required this.crop});

  factory SoilResultModel.fromJson(Map<String, dynamic> data) {
    return SoilResultModel(crop: data['recommended_crop'] ?? '');
  }
}
