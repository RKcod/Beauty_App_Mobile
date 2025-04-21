class AddressGeo {
  final String formatted;
  final String addressLine1;
  final double lon;
  final double lat;
  AddressGeo({
    required this.formatted,
    required this.addressLine1,
    required this.lon,
    required this.lat,
  });

  factory AddressGeo.fromMap(Map<String, dynamic> map) {
    return AddressGeo(
      formatted: map['formatted'] as String,
      addressLine1: map['address_line1'] as String,
      lon: map['lon'] as double,
      lat: map['lat'] as double,
    );
  }
}
