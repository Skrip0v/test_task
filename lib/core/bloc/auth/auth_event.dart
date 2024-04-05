// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AuthEvent {}

class AuthRequestCodeEvent extends AuthEvent {
  String phoneNumber;

  AuthRequestCodeEvent({
    required this.phoneNumber,
  });
}

class AuthRequestAgainCodeEvent extends AuthEvent {}

class AuthCheckCodeEvent extends AuthEvent {
  String code;

  AuthCheckCodeEvent({
    required this.code,
  });
}
