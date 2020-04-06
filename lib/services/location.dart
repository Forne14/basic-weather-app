import 'package:location/location.dart';

class Locator {
  double latitude;
  double longitude;

  Future<void> getLocation() async{
    Location location = Location();
    try{
      LocationData locationData = await location.getLocation();
      longitude = locationData.longitude;
      latitude = locationData.latitude;
    }catch(e) {
      print(e);
    }
  }
}