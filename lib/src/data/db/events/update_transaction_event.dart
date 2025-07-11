part of '../db.dart';

@DataClassName('UpdateTransactionEventDbModel')
class UpdateTransactionEventTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // transactionId

  IntColumn get accountId => integer()();
  IntColumn get categoryId => integer()();

  TextColumn get amount => text()();
  DateTimeColumn get transactionDate => dateTime()();
  TextColumn get comment => text().nullable()();
}
