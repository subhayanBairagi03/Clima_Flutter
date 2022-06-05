import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/services/networking.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();

  var weatherdata;

  LocationScreen({this.weatherdata});
}

class _LocationScreenState extends State<LocationScreen> {
  var tempText;
  var temp;
  var description;
  var timezone;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUI(widget.weatherdata);
  }

  void UpdateUI(var body) {
    if (body != null) {
      WeatherModel weatherModel = WeatherModel();
      print("Update UI is called");
      timezone = body['timezone'];
      temp = body['current']['temp'];
      temp = temp.toInt();
      description = body['current']['weather'][0]['description'];
      // weatherIcon = body['current']['weather'][0]
      ['icon']; // The ID in the json  , is the condition
      tempText = weatherModel.getMessage(temp);
    } else {
      timezone = 'Null';
      temp = 0;
      description = ' ';
      tempText = "Enter again";
    }
  }

  void UpdateUICity(var body) {
    if (body != null) {
      WeatherModel weatherModel = WeatherModel();
      print("Update UI city is called");
      timezone = body['name'];
      temp = body['main']['temp'];
      temp = temp.toInt();
      description = body['weather'][0]['description'];
      tempText = weatherModel.getMessage(temp);
    } else {
      timezone = 'Null';
      temp = 0;
      description = ' ';
      tempText = "Enter again";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      print('onpressed pressed');
                      Networkhelper networkhelper = Networkhelper();
                      var body = await networkhelper.getWeatherCord();
                      setState(() {
                        UpdateUI(body);
                      });
                      print(body['timezone']);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 30.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var body;
                      var cityname = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (cityname != null) {
                        Networkhelper net = Networkhelper();
                        body = await net.getweatherCity(cityname);
                        setState(() {
                          UpdateUICity(body);
                        });
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '$timezone',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      '$temp',
                      style: kTempTextStyle,
                    ),
                    const Text(
                      '°C',
                      style: kConditionTextStyle,
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '$description',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  tempText,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
