import 'dart:convert';

Map<String, List<Region>> regionFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<Region>>(
        k, List<Region>.from(v.map((x) => regionValues.map[x]))));

String regionToJson(Map<String, List<Region>> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(
        k, List<dynamic>.from(v.map((x) => regionValues.reverse[x])))));

enum Region { ROSSO, EMPTY }

final regionValues =
    EnumValues({"\ud83d\udd34": Region.EMPTY, "rosso": Region.ROSSO});

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
