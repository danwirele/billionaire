import 'dart:async';
import 'dart:convert';
import 'dart:developer' show log;

import 'package:billionaire/src/app.dart';
import 'package:billionaire/src/data/datasources/remote/bank_account_datasource.dart';
import 'package:billionaire/src/data/utils/dio_service.dart';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_response_model.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/image_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
      ImageUtils.svgPrecacheImage();
      // print(
      //   jsonDecode(
      //     r'[{"id": 145, "userId": 145, "name": , "balance": -57558.00, "currency": RUB, "createdAt": 2025-04-15T10:22:05.996891Z, "updatedAt": 2025-06-21T13:11:18.832009Z}]',
      //   ),
      // );
      final interceptor = DeserializationInterceptor<AccountModel>(
        fromJsonFactory: (p0) => AccountModel.fromJson(p0),
      );
      final dio = Dio()..interceptors.add(interceptor);
      print(dio.interceptors);

      dio.interceptors.remove(interceptor);
      print(dio.interceptors);
      final response = await dio.get(
        '',
        options: Options(
          headers: {
            'Authorization': 'Bearer',
          },
        ),
      );
      // print(response.data.runtimeType);
      final json = response.data;
      final model = AccountResponseModel.fromJson(
        json as Map<String, dynamic>,
      );
      print(model);
      // print(jsonDecode(json));

      // final model = AccountModel.fromJson(json);

      runApp(const App());
    },
    (error, st) {
      log('call(runZoneGuarded) $error $st');
    },
  );
}
