import 'package:mobile_create/app/domain/services/locationPermission_service.dart';
import 'package:mobile_create/app/domain/services/location_service.dart';
import 'package:mobx/mobx.dart';
import 'package:geolocator/geolocator.dart';

part 'location_store.g.dart';

class LocationStore = _LocationStore with _$LocationStore;

abstract class _LocationStore with Store {
  final LocationPermissionService _permissionService;

  _LocationStore(this._permissionService);

  @observable
  double distance = 0.0;

  @observable
  Position? currentPosition;

  @observable
  bool hasLocationPermission = false;

  @action
  Future<void> getCurrentLocation() async {
    hasLocationPermission = await _permissionService.requestLocationPermission();

    if (!hasLocationPermission) {
      return;
    }

    currentPosition = await Geolocator.getCurrentPosition();
  }

  @action
  void calculateDistanceTo(double targetLat, double targetLon) {
    if (currentPosition != null) {
      distance = LocationService.calculateDistance(
        currentPosition!.latitude,
        currentPosition!.longitude,
        targetLat,
        targetLon,
      );
    }
  }
}
