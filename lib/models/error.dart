class Errors {
  final int code;
  final String? reason;

  Errors(this.code, this.reason);

  @override
  String toString() {
    return 'Error: $reason ($code)';
  }
}
