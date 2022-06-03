import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var longitude;
  var latitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    location loc = new location();
    await loc.Getlocation();
    longitude = loc.getLongitude();
    latitude = loc.getLatitude();
    Networkhelper networkhelper = Networkhelper(lon: longitude, lat: latitude);
    var body = await networkhelper.getweather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

//
