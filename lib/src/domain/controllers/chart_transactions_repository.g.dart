// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_transactions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chartTransactionsRepositoryHash() =>
    r'9f80dce44f0ac727c512557bd773221fbe940477';

/// See also [ChartTransactionsRepository].
@ProviderFor(ChartTransactionsRepository)
final chartTransactionsRepositoryProvider =
    AutoDisposeAsyncNotifierProvider<
      ChartTransactionsRepository,
      List<TransactionResponseModel>?
    >.internal(
      ChartTransactionsRepository.new,
      name: r'chartTransactionsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$chartTransactionsRepositoryHash,
      dependencies: <ProviderOrFamily>[userAccountRepositoryProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        userAccountRepositoryProvider,
        ...?userAccountRepositoryProvider.allTransitiveDependencies,
      },
    );

typedef _$ChartTransactionsRepository =
    AutoDisposeAsyncNotifier<List<TransactionResponseModel>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
