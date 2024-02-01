class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.message, this.statusCode);
}
