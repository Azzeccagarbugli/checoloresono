import 'dart:convert';

import 'package:checoloresono/models/region.dart';
import 'package:http/http.dart' as http;

Map<String, List<Region>> fetchRegion() {
  // final response = await client.get('http://befair1.befair.it:8081/');

  return regionFromJson(_body);
}

String _body = """ 
    {"Piemonte": ["rosso", "\ud83d\udd34"], "Veneto": ["rosso", "\ud83d\udd34"], "Lombardia": ["rosso", "\ud83d\udd34"], "Emilia-Romagna": ["rosso", "\ud83d\udd34"], "Umbria": ["rosso", "\ud83d\udd34"], "Lazio": ["rosso", "\ud83d\udd34"], "Toscana": ["rosso", "\ud83d\udd34"], "Abbruzzo": ["rosso", "\ud83d\udd34"], "Molise": ["rosso", "\ud83d\udd34"], "Basilicata": ["rosso", "\ud83d\udd34"], "Puglia": ["rosso", "\ud83d\udd34"], "Marche": ["rosso", "\ud83d\udd34"], "Sicilia": ["rosso", "\ud83d\udd34"], "Sardegna": ["rosso", "\ud83d\udd34"], "Liguria": ["rosso", "\ud83d\udd34"], "Trentino-Alto Adige": ["rosso", "\ud83d\udd34"], "Bolzano": ["rosso", "\ud83d\udd34"], "Friuli-Venezia Giulia": ["rosso", "\ud83d\udd34"], "Valle d'Aosta": ["rosso", "\ud83d\udd34"], "Campania": ["rosso", "\ud83d\udd34"], "Calabria": ["rosso", "\ud83d\udd34"]}
""";
