abstract class Failure implements Exception {}

class FailureSignin implements Failure {
  final String message;
  FailureSignin({this.message});
}
