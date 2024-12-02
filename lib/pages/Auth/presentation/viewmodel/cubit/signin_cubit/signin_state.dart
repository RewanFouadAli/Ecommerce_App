abstract class SigninState {}

class InitialState extends SigninState {}

class LoadingState extends SigninState {}

class SuccesState extends SigninState {}

class ErrorState extends SigninState {
  final String message;
  ErrorState(this.message);
}
