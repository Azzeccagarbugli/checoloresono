import 'package:http/http.dart' as http;

import 'package:checoloresono/models/region.dart';

Future<Map<String, List<Region>>> fetchRegion() async {
  final _response =
      await http.Client().get('https://checoloresono.info/colors.json');

  return regionFromJson(_response.body);
}
