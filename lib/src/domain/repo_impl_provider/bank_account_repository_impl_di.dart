import 'package:billionaire/src/data/datasources/local/bank_account_local_datasource.dart';
import 'package:billionaire/src/data/datasources/remote/bank_account_datasource.dart';
import 'package:billionaire/src/data/db/db_service.dart';
import 'package:billionaire/src/data/repositories/impl/bank_account_repository_impl.dart';
import 'package:billionaire/src/data/utils/dio_service.dart';
import 'package:billionaire/src/domain/repositories/bank_account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bank_account_repository_impl_di.g.dart';

@Riverpod(keepAlive: true)
class BankAccountRepositoryImplDi
    extends _$BankAccountRepositoryImplDi {
  @override
  FutureOr<BankAccountRepository> build() async {
    final dio = ref.read(dioServiceProvider);
    final database = await ref.read(dbServiceProvider.future);

    return BankAccountRepositoryImpl(
      database: database,
      remoteDatasource: BankAccountRemoteDatasourceImpl(dio: dio),
      localDatasource: BankAccountLocalDatasourceImpl(
        database: database,
      ),
    );
  }
}
