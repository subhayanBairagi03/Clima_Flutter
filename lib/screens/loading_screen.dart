import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
