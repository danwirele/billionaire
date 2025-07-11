part of '../db.dart';

@DataClassName('TransactionDbModel')
class TransactionTable extends Table {
  IntColumn get id => integer().unique()();

  IntColumn get accountId => integer()();
  IntColumn get categoryId => integer()();

  TextColumn get amount => text()();
  DateTimeColumn get transactionDate => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get comment => text().nullable()();
}
