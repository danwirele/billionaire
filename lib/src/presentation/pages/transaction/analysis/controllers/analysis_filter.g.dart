// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analysisFilterHash() => r'76b87694d6b3ece85d7ccee34d7aaf4920fc1196';

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
