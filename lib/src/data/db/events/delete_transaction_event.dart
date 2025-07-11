part of '../db.dart';

@DataClassName('DeleteTransactionEventDbModel')
class DeleteTransactionEventTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // transactionId
}
