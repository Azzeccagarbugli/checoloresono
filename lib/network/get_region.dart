import 'package:http/http.dart' as http;

import 'package:checoloresono/models/region.dart';

Future<Map<String, List<Region>>> fetchRegion() async {
  final _response = await http.Client().get(
      'https://cors-anywhere.herokuapp.com/http://befair1.befair.it:8081/');

  return regionFromJson(_response.body);
}
