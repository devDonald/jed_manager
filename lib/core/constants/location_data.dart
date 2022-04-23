class LocationData {
  late final double latitude; // Latitude, in degrees
  late final double longitude; // Longitude, in degrees
  late final double
      accuracy; // Estimated horizontal accuracy of this location, radial, in meters
  late final double altitude; // In meters above the WGS 84 reference ellipsoid
  late final double speed; // In meters/second
  late final double speedAccuracy; // In meters/second, always 0 on iOS
  late final double
      heading; // Heading is the horizontal direction of travel of this device, in degrees
  late final double time; // timestamp of the LocationData
  late final bool isMock; // Is the location currently mocked
}

enum LocationAccuracy {
  powerSave, // To request best accuracy possible with zero additional power consumption,
  low, // To request "city" level accuracy
  balanced, // To request "block" level accuracy
  high, // To request the most accurate locations available
  navigation // To request location for navigation usage (affect only iOS)
}

// Status of a permission request to use location services.
enum PermissionStatus {
  /// The permission to use location services has been granted.
  granted,
  // The permission to use location services has been denied by the user. May have been denied forever on iOS.
  denied,
  // The permission to use location services has been denied forever by the user. No dialog will be displayed on permission request.
  deniedForever
}
