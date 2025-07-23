// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_transactions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analysisTransactionsRepositoryHash() =>
    r'7e3c208e3b40461036228dacd5857772d58a57e7';

/// See also [AnalysisTransactionsRepository].
@ProviderFor(AnalysisTransactionsRepository)
final analysisTransactionsRepositoryProvider =
    AutoDisposeAsyncNotifierProvider<
      AnalysisTransactionsRepository,
      List<TransactionResponseModel>?
    >.internal(
      AnalysisTransactionsRepository.new,
      name: r'analysisTransactionsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$analysisTransactionsRepositoryHash,
      dependencies: <ProviderOrFamily>[userAccountRepositoryProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        userAccountRepositoryProvider,
        ...?userAccountRepositoryProvider.allTransitiveDependencies,
      },
    );

typedef _$AnalysisTransactionsRepository =
    AutoDisposeAsyncNotifier<List<TransactionResponseModel>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
