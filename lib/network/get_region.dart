import 'package:http/http.dart' as http;

import 'package:checoloresono/models/region.dart';

// Future<Map<String, List<Region>>> fetchRegion(http.Client client) async {
//   final response = await client.get('http://befair1.befair.it:8081/');

//   return regionFromJson(_body);
// }

Map<String, List<Region>> fetchRegion(http.Client client) {
  // final response = await client.get('http://befair1.befair.it:8081/');

  return regionFromJson(_body);
}

String _body = """
   
{
  "Piemonte": [
    "giallo",
    "🟡"
  ],
  "Veneto": [
    "arancione",
    "🟠"
  ],
  "Lombardia": [
    "arancione",
    "🟠"
  ],
  "Emilia-Romagna": [
    "arancione",
    "🟠"
  ],
  "Umbria": [
    "giallo",
    "🟡"
  ],
  "Lazio": [
    "giallo",
    "🟡"
  ],
  "Toscana": [
    "giallo",
    "🟡"
  ],
  "Abbruzzo": [
    "giallo",
    "🟡"
  ],
  "Molise": [
    "giallo",
    "🟡"
  ],
  "Basilicata": [
    "giallo",
    "🟡"
  ],
  "Puglia": [
    "giallo",
    "🟡"
  ],
  "Marche": [
    "giallo",
    "🟡"
  ],
  "Sicilia": [
    "arancione",
    "🟠"
  ],
  "Sardegna": [
    "giallo",
    "🟡"
  ],
  "Liguria": [
    "giallo",
    "🟡"
  ],
  "Trentino-Alto Adige": [
    "giallo",
    "🟡"
  ],
  "Bolzano": [
    "giallo",
    "🟡"
  ],
  "Friuli-Venezia Giulia": [
    "giallo",
    "🟡"
  ],
  "Valle d'Aosta": [
    "giallo",
    "🟡"
  ],
  "Campania": [
    "giallo",
    "🟡"
  ],
  "Calabria": [
    "arancione",
    "🟠"
  ]
}
   """;
