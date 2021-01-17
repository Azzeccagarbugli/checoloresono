import 'dart:convert';

import 'package:flutter/material.dart';

Map<String, List<Region>> regionFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<Region>>(
        k, List<Region>.from(v.map((x) => regionValues.map[x]))));

String regionToJson(Map<String, List<Region>> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(
        k, List<dynamic>.from(v.map((x) => regionValues.reverse[x])))));

enum Region {
  GIALLO,
  ARANCIONE,
  ROSSO,
}

extension RegionExtension on Region {
  String get name {
    switch (this) {
      case Region.ROSSO:
        return 'rosso';
      case Region.ARANCIONE:
        return 'arancione';
      case Region.GIALLO:
        return 'giallo';
      default:
        return null;
    }
  }

  Color get color {
    switch (this) {
      case Region.ROSSO:
        return Colors.red;
      case Region.ARANCIONE:
        return Colors.orange;
      case Region.GIALLO:
        return Colors.yellow[600];
      default:
        return Colors.transparent;
    }
  }
}

final regionValues = EnumValues({
  'arancione': Region.ARANCIONE,
  'giallo': Region.GIALLO,
  'rosso': Region.ROSSO
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
