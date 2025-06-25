// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analysisFilterHash() => r'ebc10aaba7413faeff7e75ee7faf263d158b78d2';

/// See also [AnalysisFilter].
@ProviderFor(AnalysisFilter)
final analysisFilterProvider =
    AutoDisposeNotifierProvider<
      AnalysisFilter,
      AnalysisFilterStateModel
    >.internal(
      AnalysisFilter.new,
      name: r'analysisFilterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$analysisFilterHash,
      dependencies: <ProviderOrFamily>[analysisTransactionsRepositoryProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        analysisTransactionsRepositoryProvider,
        ...?analysisTransactionsRepositoryProvider.allTransitiveDependencies,
      },
    );

typedef _$AnalysisFilter = AutoDisposeNotifier<AnalysisFilterStateModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
