class AddressGeoapify {
  final String formatted;
  final String addressLine1;
  final double lon;
  final double lat;
  AddressGeoapify({
    required this.formatted,
    required this.addressLine1,
    required this.lon,
    required this.lat,
  });

  factory AddressGeoapify.fromMap(Map<String, dynamic> map) {
    return AddressGeoapify(
      formatted: map['formatted'] as String,
      addressLine1: map['address_line1'] as String,
      lon: map['lon'] as double,
      lat: map['lat'] as double,
    );
  }
}
