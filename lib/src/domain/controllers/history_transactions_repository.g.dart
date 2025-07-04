// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_transactions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyTransactionsRepositoryHash() =>
    r'762d2dc9d34f11834b62b22f2945933f953cb992';

/// See also [HistoryTransactionsRepository].
@ProviderFor(HistoryTransactionsRepository)
final historyTransactionsRepositoryProvider =
    AutoDisposeAsyncNotifierProvider<
      HistoryTransactionsRepository,
      List<TransactionResponseModel>?
    >.internal(
      HistoryTransactionsRepository.new,
      name: r'historyTransactionsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$historyTransactionsRepositoryHash,
      dependencies: <ProviderOrFamily>[userAccountRepositoryProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        userAccountRepositoryProvider,
        ...?userAccountRepositoryProvider.allTransitiveDependencies,
      },
    );

typedef _$HistoryTransactionsRepository =
    AutoDisposeAsyncNotifier<List<TransactionResponseModel>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
