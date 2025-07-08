import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  Future<void> init() async {
    _dotenv = DotEnv();
    await _dotenv.load();
    apiKey = _dotenv.env['BEARER']!;
    baseUrl = _dotenv.env['BASE_URL']!;
  }

  // Загрузка переменных окружения
  static late final DotEnv _dotenv;
  // Статические поля для хранения значений
  static late final String apiKey;
  static late final String baseUrl;
}
