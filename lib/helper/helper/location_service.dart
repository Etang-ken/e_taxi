import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    // Request location permission
    await _requestPermission();

    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool opened = await Geolocator.openLocationSettings();
      if (!opened) {
        return Future.error('Location services are disabled and cannot be enabled automatically.');
      }
    }

    // Get the current position
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> _requestPermission() async {
    var status = await Permission.locationWhenInUse.request();

    if (status.isDenied) {
      // If the permission is denied, show an error
      throw Exception('Location permission denied');
    } else if (status.isPermanentlyDenied) {
      // If the permission is permanently denied, open app settings
      await openAppSettings();
      throw Exception('Location permission permanently denied');
    }
  }

  Future<String> getAddressFromCoordinates(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];
      return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
    } catch (e) {
      throw Exception('Error occurred while fetching address: $e');
    }
  }
}
