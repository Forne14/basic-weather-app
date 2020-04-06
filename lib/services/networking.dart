import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:simpleweather/utilities/constants.dart';

class NetworkHelper{
  final String url;
  NetworkHelper(this.url);

  Future<http.Response> getData() async {
    http.Response response = await http.get(url);
    return response;
  }
}

