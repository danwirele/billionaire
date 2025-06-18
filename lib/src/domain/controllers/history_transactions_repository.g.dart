// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_transactions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyTransactionsRepositoryHash() =>
    r'c0252397d3944f3506e93863d4a4274afc48e83d';

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
