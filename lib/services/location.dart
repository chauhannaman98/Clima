import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      print('getting position');
      Position position = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.latitude;
      longitude = position.longitude;
      print('saved data');
    } catch(e)  {
      print(e);
    }
  }

  Future<void> getLastKnownLocation() async {
    try {
      print('getting position');
      Position position = await getLastKnownPosition(
          forceAndroidLocationManager: true
      );
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
      print('saved data');
    } catch(e)  {
      print(e);
    }
  }
}
