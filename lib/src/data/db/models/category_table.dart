part of '../db.dart';

@DataClassName('CategoryDbModel')
class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get apiId => integer()();

  TextColumn get name => text()();
  TextColumn get emoji => text()();
  BoolColumn get isIncome => boolean()();
}
