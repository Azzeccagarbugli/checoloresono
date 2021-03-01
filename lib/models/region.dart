import 'dart:convert';

import 'package:flutter/material.dart';

Map<String, List<Region>> regionFromJson(String str) =>
    Map.from(json.decode(str) as Map<dynamic, dynamic>).map((k, v) =>
        MapEntry<String, List<Region>>(k as String,
            List<Region>.from(v.map((x) => regionValues.map[x]) as Iterable)));

String regionToJson(Map<String, List<Region>> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(
        k as String,
        List<dynamic>.from(
            v.map((x) => regionValues.reverse[x]) as Iterable))));

enum Region {
  giallo,
  arancione,
  rosso,
}

extension RegionExtension on Region {
  String get name {
    switch (this) {
      case Region.rosso:
        return 'rosso';
      case Region.arancione:
        return 'arancione';
      case Region.giallo:
        return 'giallo';
      default:
        return null;
    }
  }

  Color get color {
    switch (this) {
      case Region.rosso:
        return Colors.red;
      case Region.arancione:
        return Colors.orange;
      case Region.giallo:
        return Colors.yellow[600];
      default:
        return Colors.transparent;
    }
  }

  Color get darkerColor {
    switch (this) {
      case Region.rosso:
        return Colors.red[800];
      case Region.arancione:
        return Colors.orange[800];
      case Region.giallo:
        return Colors.yellow[800];
      default:
        return Colors.transparent;
    }
  }
}

final regionValues = EnumValues({
  'arancione': Region.arancione,
  'giallo': Region.giallo,
  'rosso': Region.rosso,
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return reverseMap ??= map.map((k, v) => MapEntry(v, k));
  }
}
