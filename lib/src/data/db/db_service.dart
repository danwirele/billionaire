import 'dart:io';

import 'package:billionaire/src/data/db/db.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_service.g.dart';

@Riverpod(keepAlive: true)
class DbService extends _$DbService {
  @override
  FutureOr<Database> build() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbPath = '${appDir.path}/dogs.db';
    final dbFile = File(dbPath);

    final dbConnection = NativeDatabase.createBackgroundConnection(
      dbFile,
    );
    return Database(dbConnection);
  }
}
