import 'package:simpleweather/utilities/constants.dart';
import 'package:simpleweather/services/location.dart';
import 'package:simpleweather/services/networking.dart';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    Locator locator = Locator();
    await locator.getLocation();

    var url = "$weatherUrl?lat=${locator.latitude}&lon=${locator.longitude}&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherInfo = await networkHelper.getData();
    return weatherInfo;
  }

  Future<dynamic> getCityWeather(String city) async {
    var url = "$weatherUrl?q$city&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherInfo = await networkHelper.getData();
    return weatherInfo;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
