//show loading indicator
abstract class DefaultLoadingState {}

//show error dialog. close this dialog will do nothing
abstract class DefaultFailureState {
  final dynamic error;

  DefaultFailureState(this.error);
}