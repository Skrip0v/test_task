import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/bloc/auth/auth_event.dart';
import 'package:test_task/core/bloc/auth/auth_state.dart';
import 'package:test_task/core/repos/auth_rep.dart';
import 'package:test_task/core/repos/request_results/auth_check_code_result.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRep = AuthRep();
  late String phoneNumber;

  AuthBloc() : super(AuthNotLoggedState()) {
    on<AuthRequestCodeEvent>(requestCode);
    on<AuthCheckCodeEvent>(checkCode);
    on<AuthRequestAgainCodeEvent>(requestAgainCode);
  }

  Future<void> requestCode(
    AuthRequestCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    phoneNumber = event.phoneNumber;

    var result = await _authRep.requestCode(phoneNumber);

    if (result is String) {
      emit(AuthNotLoggedErrorState(error: result));
    } else {
      emit(AuthWaitCodeState());
    }
  }

  Future<void> checkCode(
    AuthCheckCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    var result = await _authRep.checkCode(
      phoneNumber: phoneNumber,
      code: event.code,
    );

    if (result is AuthCheckCodeSuccessResult) {
      emit(AuthLoggedState(accessToken: result.accessToken));
    } else if (result is AuthCheckCodeErrorResult) {
      emit(AuthWaitCodeErrorState(error: result.message));
    }
  }

  Future<void> requestAgainCode(
    AuthRequestAgainCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    var result = await _authRep.requestCode(phoneNumber);

    if (result is String) {
      emit(AuthWaitCodeErrorState(error: result));
    }
  }
}
