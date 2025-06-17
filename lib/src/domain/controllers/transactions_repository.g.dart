// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionsRepositoryHash() =>
    r'11c7bb0b245db70096e26ac0f21a7c4461563077';

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
      dependencies: <ProviderOrFamily>[userAccountRepositoryProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        userAccountRepositoryProvider,
        ...?userAccountRepositoryProvider.allTransitiveDependencies,
      },
    );

typedef _$TransactionsRepository =
    AutoDisposeAsyncNotifier<List<TransactionResponseModel>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
