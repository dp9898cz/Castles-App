import 'package:flutter/foundation.dart';

enum CategoryType {
  Zdene_rozhledny,
  Zamecke_rozhledny,
  Hradni_rozhledny,
  Zelezne_rozhledny,
  Drevene_rozhledny
}

class Tower with ChangeNotifier {
  final String id;
  final String title;
  final String longtitude;
  final String latitude;
  final CategoryType categoryType;
  final String county;
  final String city;
  final double towerHeight;
  final double seaLevel;
  final String openYear;

  Tower(
      {@required this.id,
      @required this.title,
      @required this.latitude,
      @required this.longtitude,
      @required this.categoryType,
      this.county,
      @required this.city,
      this.towerHeight,
      this.seaLevel,
      this.openYear});
}
