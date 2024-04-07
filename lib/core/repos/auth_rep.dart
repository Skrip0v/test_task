// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:test_task/core/repos/request_results/auth_check_code_result.dart';

class AuthRep {
  final Dio dio;

  AuthRep({
    required this.dio,
  });

  Future<String?> requestCode(String phoneNumber) async {
    try {
      var res = await Dio().post(
        'https://beta.back.erp.itecho.ru/api/counterparty/send_password',
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
        data: {
          'phone': phoneNumber,
        },
      );

      if (res.statusCode == 200) {
        return null;
      } else {
        return res.data ?? 'Ошибка';
      }
    } catch (e) {
      return null;
    }
  }

  Future<AuthCheckCodeResult> checkCode({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      var res = await Dio().post(
        'https://beta.back.erp.itecho.ru/api/counterparty/login',
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
        data: {
          "phone": phoneNumber,
          "password": code,
        },
      );

      log(res.data.toString());

      if (res.statusCode == 200) {
        var accessToken = res.data?['counterparty']?['access_token']?['value'];
        if (accessToken is String) {
          return AuthCheckCodeSuccessResult(accessToken: accessToken);
        } else {
          return AuthCheckCodeErrorResult(
            message: 'Не удалось получить ключ',
          );
        }
      } else if (res.statusCode == 401) {
        return AuthCheckCodeErrorResult(
          message: 'Не правильно введен код',
        );
      } else {
        return AuthCheckCodeErrorResult(
          message: 'Не правильно введен код',
        );
      }
    } catch (e) {
      return AuthCheckCodeErrorResult(
        message: 'Не удалось выполнить запрос',
      );
    }
  }
}
