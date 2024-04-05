// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AuthCheckCodeResult {}

class AuthCheckCodeErrorResult extends AuthCheckCodeResult {
  String message;

  AuthCheckCodeErrorResult({
    required this.message,
  });
}

class AuthCheckCodeSuccessResult extends AuthCheckCodeResult {
  String accessToken;

  AuthCheckCodeSuccessResult({
    required this.accessToken,
  });
}
