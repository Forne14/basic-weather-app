import 'package:flutter/material.dart';
const String apiKey = "86b1c5ff6ece679468ab476a533f3251";
const String weatherUrl = "https://api.openweathermap.org/data/2.5/weather";
const kTempTextStyle = TextStyle(

  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize:40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter City",
  hintStyle: TextStyle(color: Colors.blueGrey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0))
  ),
);