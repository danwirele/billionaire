// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chartHash() => r'c7ff21fd7a16c35f86347e77cff70ecce5842159';

/// See also [Chart].
@ProviderFor(Chart)
final chartProvider =
    AutoDisposeAsyncNotifierProvider<Chart, List<BalanceEntity>>.internal(
      Chart.new,
      name: r'chartProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$chartHash,
      dependencies: <ProviderOrFamily>[chartTransactionsRepositoryProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        chartTransactionsRepositoryProvider,
        ...?chartTransactionsRepositoryProvider.allTransitiveDependencies,
      },
    );

typedef _$Chart = AutoDisposeAsyncNotifier<List<BalanceEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
