// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionsRepositoryHash() =>
    r'f63977660fa71557a8bb6efb8a74c68de4b621c2';

/// See also [TransactionsRepository].
@ProviderFor(TransactionsRepository)
final transactionsRepositoryProvider =
    AutoDisposeAsyncNotifierProvider<
      TransactionsRepository,
      List<TransactionResponseModel>?
    >.internal(
      TransactionsRepository.new,
      name: r'transactionsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$transactionsRepositoryHash,
      dependencies: <ProviderOrFamily>[
        userAccountRepositoryProvider,
        dbServiceProvider,
        dioServiceProvider,
      ],
      allTransitiveDependencies: <ProviderOrFamily>{
        userAccountRepositoryProvider,
        ...?userAccountRepositoryProvider.allTransitiveDependencies,
        dbServiceProvider,
        ...?dbServiceProvider.allTransitiveDependencies,
        dioServiceProvider,
        ...?dioServiceProvider.allTransitiveDependencies,
      },
    );

typedef _$TransactionsRepository =
    AutoDisposeAsyncNotifier<List<TransactionResponseModel>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
