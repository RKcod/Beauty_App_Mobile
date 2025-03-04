extension ListExtension on List? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}
