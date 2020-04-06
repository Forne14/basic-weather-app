import 'dart:convert';
import 'package:simpleweather/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:simpleweather/utilities/constants.dart';
import 'package:simpleweather/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {

  final Response  locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  String emoji;
  String message;
  var name;
  var temperature;
  var condition;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherInfo){
    setState(() {

    });
    if(weatherInfo == null){
      name = "";
      temperature = 0;
      message = "Could not get weather information";
      emoji = "Error";
    }
    var body = jsonDecode(weatherInfo.body);
    name = body["name"];
    temperature = (body["main"]["temp"]).round();
    condition = body["weather"][0]["id"];
    message = weatherModel.getMessage(temperature)  + " in $name";
    emoji = weatherModel.getWeatherIcon(condition);
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
                      var weatherInfo = await  weatherModel.getLocationWeather();
                      setState(() {
                        updateUi(weatherInfo);
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var userTypedCity = await
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if(userTypedCity != null){
                        print("$userTypedCity");
                        var weatherInfo = await weatherModel.getCityWeather(userTypedCity);
                        updateUi(weatherInfo);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      "$emoji",
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message",
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
