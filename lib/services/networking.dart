import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';

class Networkhelper {
  double longitude = 0.0;
  double latitude = 0.0;
  Networkhelper({double? lon, double? lat}) {
    longitude = lon!;
    latitude = lat!;
  }

  Future getweather() async {
    late var query = {
      'lat': '$latitude',
      'lon': '$longitude',
      'exclude': 'hourly,daily',
      'APPID': '6dd7684d656f438026ad2abc607e6480'
    };
    Response response = await http
        .get(Uri.http('api.openweathermap.org', 'data/2.5/onecall', query));

    if (response.statusCode == 200) {
      String body = response.body;

      var decoded = jsonDecode(body);
      return decoded;
    } else
      return (response.statusCode);
  }
}
