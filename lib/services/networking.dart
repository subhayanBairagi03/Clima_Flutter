import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';
import 'location.dart';

class Networkhelper {
  double longitude = 0.0;
  double latitude = 0.0;

  Future getWeatherCord() async {
    location loc = location();
    await loc.Getlocation();
    longitude = loc.getLongitude();
    latitude = loc.getLatitude();
    late var query = {
      'lat': '$latitude',
      'lon': '$longitude',
      'exclude': 'hourly,daily,minutely',
      'units': 'metric',
      'APPID': '6dd7684d656f438026ad2abc607e6480'
    };
    Response response = await http
        .get(Uri.http('api.openweathermap.org', 'data/2.5/onecall', query));

    if (response.statusCode == 200) {
      String body = response.body;

      var decoded = jsonDecode(body);
      return decoded;
    } else {
      return null;
    }
  }

  Future getweatherCity(String City) async {
    late var query = {
      'q': City,
      'units': 'metric',
      'APPID': '6dd7684d656f438026ad2abc607e6480'
    };
    Response response = await http
        .get(Uri.http('api.openweathermap.org', 'data/2.5/weather', query));
    if (response.statusCode == 200) {
      String body = response.body;

      var decoded = jsonDecode(body);
      return decoded;
    } else {
      return null;
    }
  }
}
