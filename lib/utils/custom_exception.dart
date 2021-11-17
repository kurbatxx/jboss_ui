class RustException implements Exception {
  final String message;

  RustException(this.message);

  @override
  String toString() {
    return message;
  }
}
