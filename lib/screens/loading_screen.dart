import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
  }

  void getlocation() {
    location loc = new location();
    loc.Getlocation();
    print(loc.longitude);
    print(loc.latitude);
  }

  void getdata() async {
    Response response = await http.get(Uri.http('api.openweathermap.org',
        'data/3.0/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid={demo api}'));

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold();
  }
}
