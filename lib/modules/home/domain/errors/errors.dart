abstract class Failure implements Exception {}

class FailureGetNews extends Failure {
  final String message;

  FailureGetNews({this.message});
}
