part of '../db.dart';

@DataClassName('TransactionDbModel')
class TransactionTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get apiId => integer().nullable()();

  IntColumn get accountId => integer()();
  IntColumn get categoryId => integer()();

  TextColumn get amount => text()();
  DateTimeColumn get transactionDate => dateTime()();
  TextColumn get comment => text().nullable()();
}
