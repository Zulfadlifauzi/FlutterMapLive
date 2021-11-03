import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  BitmapDescriptor? _pinLocationIcon;
  BitmapDescriptor get pinLocationIcon => _pinLocationIcon!;
  Map<MarkerId, Marker>? _markers;
  Map<MarkerId, Marker>? get markers => _markers;

  final MarkerId markerId = const MarkerId('1');

  Location? _location;
  Location get location => _location!;
  LatLng? _locationPosition;
  LatLng? get locationPosition => _locationPosition;

  bool locationServiceActive = true;

  LocationProvider() {
    _location = Location();
  }

  initialization() async {
    await getUserLocation();
    await setCustomMapPin();
  }

  getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen((LocationData currentLocation) {
      _locationPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
      print(_locationPosition);

      _markers = <MarkerId, Marker>{};
      Marker marker = Marker(
          markerId: markerId,
          position:
              LatLng(currentLocation.latitude!, currentLocation.longitude!),
          icon: pinLocationIcon,
          draggable: true,
          onDragEnd: ((newPosition) {
            _locationPosition =
                LatLng(newPosition.latitude, newPosition.longitude);
            notifyListeners();
          }));

      _markers?[markerId] = marker;

      notifyListeners();
    });
  }

  setCustomMapPin() async {
    _pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/marker2.png');
  }
}
