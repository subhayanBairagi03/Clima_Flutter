import 'package:geolocator/geolocator.dart';

class location {
  double _latitude = 0.0;
  double _longitude = 0.0;

  Future<void> Getlocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        _latitude = position.latitude;
        _longitude = position.longitude;
      } catch (e) {
        print(e);
      }
    }
  }

  double getLatitude() {
    return _latitude;
  }

  double getLongitude() {
    return _longitude;
  }
}
