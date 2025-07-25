part of '../db.dart';

@DataClassName('AccountDbModel')
class AccountTable extends Table {
  IntColumn get id => integer().unique()();
  IntColumn get userId => integer()();
  TextColumn get name => text()();
  TextColumn get balance => text()();
  TextColumn get currency => text()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
}
