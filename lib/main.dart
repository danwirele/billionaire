import 'dart:async';
import 'dart:developer' show log;

import 'package:billionaire/core/config/config.dart';
import 'package:billionaire/src/app.dart';
import 'package:billionaire/src/data/utils/dio_service.dart';
import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/image_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
      ImageUtils.svgPrecacheImage();

      final client = Dio();
      final config = await Config().init();
      client.interceptors.removeImplyContentTypeInterceptor();
      client..interceptors.add(DeserializationInterceptor());

      final response = await client.get(
        '${Config.baseUrl}/accounts',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${Config.apiKey}',
          },
          extra: {'dtoType': AccountBriefModel},
        ),
      );

      debugPrint(
        (response.data as List<dynamic>)
            .map(
              (e) => e as AccountBriefModel,
            )
            .toList()
            .toString(),
      );

      runApp(const ProviderScope(child: App()));
    },
    (error, st) {
      log('call(runZoneGuarded) $error $st');
    },
  );
}
