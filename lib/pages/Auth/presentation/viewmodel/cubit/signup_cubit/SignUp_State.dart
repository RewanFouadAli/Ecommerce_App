abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class SuccesState extends AuthState {}

class ErrorState extends AuthState {
  final String message;
  ErrorState(this.message);
}
