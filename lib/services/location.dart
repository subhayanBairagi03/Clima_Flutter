import 'package:geolocator/geolocator.dart';

class location {
  double latitude = 0.0;
  double longitude = 0.0;

  Future<void> Getlocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
        print('latitude: $latitude , longitude: $longitude');
      } catch (e) {
        print(e);
      }
    }
  }
}
