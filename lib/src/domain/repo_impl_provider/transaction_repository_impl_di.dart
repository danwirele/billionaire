import 'package:billionaire/src/data/datasources/local/transaction_local_datasource.dart';
import 'package:billionaire/src/data/datasources/remote/transaction_datasource.dart';
import 'package:billionaire/src/data/db/db_service.dart';
import 'package:billionaire/src/data/db/events_datasource/transaction_event_datasource.dart';
import 'package:billionaire/src/data/repositories/impl/transaction_repository_impl.dart';
import 'package:billionaire/src/data/services/dio_service.dart';
import 'package:billionaire/src/domain/repositories/transaction_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_repository_impl_di.g.dart';

@Riverpod(keepAlive: true)
class TransactionRepositoryImplDi
    extends _$TransactionRepositoryImplDi {
  @override
  FutureOr<TransactionRepository> build() async {
    final database = await ref.read(dbServiceProvider.future);

    final dio = ref.read(dioServiceProvider);

    return TransactionRepositoryImpl(
      database: database,
      remoteDatasource: TransactionDatasourceImpl(dio: dio),
      localEventDatasource: TransactionEventDatasource(
        database: database,
      ),
      localDatasource: TransactionLocalDatasourceImpl(
        database: database,
      ),
    );
  }
}
