// ignore_for_file: public_member_api_docs, sort_constructors_first
class CoordinatesModel {
  final double north;
  final double east;
  final double south;
  final double west;

  CoordinatesModel(this.north, this.east, this.south, this.west);

  @override
  String toString() {
    return 'CoordinatesModel(north: $north, east: $east, south: $south, west: $west)';
  }
}
