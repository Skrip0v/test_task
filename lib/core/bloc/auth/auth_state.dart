// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AuthState {}

class AuthNotLoggedState extends AuthState {}

class AuthNotLoggedErrorState extends AuthState {
  String error;

  AuthNotLoggedErrorState({
    required this.error,
  });
}

class AuthWaitCodeState extends AuthState {}

class AuthWaitCodeErrorState extends AuthState {
  String error;

  AuthWaitCodeErrorState({
    required this.error,
  });
}

class AuthLoggedState extends AuthState {
  String accessToken;

  AuthLoggedState({
    required this.accessToken,
  });
}
