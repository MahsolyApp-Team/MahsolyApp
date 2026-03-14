import 'package:flutter/material.dart';

class ItemModel {
  final String name;
  final AssetImage image;
  final String waterNeeds;
  final String sunNeeds;
  final String soilNeeds;
  final String commonDisease;
  final String season;

  ItemModel({
    required this.name,
    required this.image,
    this.waterNeeds = 'Unknown',
    this.sunNeeds = 'Unknown',
    this.soilNeeds = 'Unknown',
    this.commonDisease = 'No common disease',
    this.season = 'Unknown season',
  });
}
