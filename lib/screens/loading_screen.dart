import 'package:flutter/material.dart';
import 'package:simpleweather/services/location.dart';
import 'package:simpleweather/services/networking.dart';
import 'dart:convert';
import 'package:simpleweather/services/weather.dart';
import 'package:simpleweather/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:simpleweather/utilities/constants.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocationData() async {

    var weatherInfo = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherInfo,);
    }));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
