abstract class Failure implements Exception {}

class FailureSignup implements Failure {
  final String message;
  FailureSignup({this.message});
}
