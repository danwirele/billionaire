part of '../db.dart';

@DataClassName('CategoryDbModel')
class CategoryTable extends Table {
  IntColumn get id => integer().unique()();

  TextColumn get name => text()();
  TextColumn get emoji => text()();
  BoolColumn get isIncome => boolean()();
}
