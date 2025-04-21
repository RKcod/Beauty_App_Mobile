class CoordinatesModel {
  final double north;
  final double east;
  final double south;
  final double west;

  CoordinatesModel(
    this.north,
    this.east,
    this.south,
    this.west,
  );

  @override
  String toString() {
    return 'CoordinatesModel(north: $north, east: $east, south: $south, west: $west)';
  }

  @override
  bool operator ==(covariant CoordinatesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.north == north &&
      other.east == east &&
      other.south == south &&
      other.west == west;
  }

  @override
  int get hashCode {
    return north.hashCode ^
      east.hashCode ^
      south.hashCode ^
      west.hashCode;
  }
}
