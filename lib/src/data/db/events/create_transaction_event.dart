part of '../db.dart';

@DataClassName('CreateTransactionEventDbModel')
class CreateTransactionEventTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // transactionId

  IntColumn get accountId => integer()();
  IntColumn get categoryId => integer()();

  TextColumn get amount => text()();
  DateTimeColumn get transactionDate => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get comment => text().nullable()();
}
