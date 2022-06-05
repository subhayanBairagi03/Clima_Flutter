import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const ktextdecoration = InputDecoration(
    border: OutlineInputBorder(),
    focusedBorder: UnderlineInputBorder(),
    hintText: 'Enter a City name',
    icon: Icon(
      Icons.location_city,
      size: 30,
      color: Colors.teal,
    ));
