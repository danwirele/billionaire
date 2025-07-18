// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$statsControllerHash() => r'e9cdea67b0550b19dc2df5c7dce78251755976ef';

/// See also [StatsController].
@ProviderFor(StatsController)
final statsControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      StatsController,
      List<CategoryModel>
    >.internal(
      StatsController.new,
      name: r'statsControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$statsControllerHash,
      dependencies: <ProviderOrFamily>[categoriesRepositoryProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        categoriesRepositoryProvider,
        ...?categoriesRepositoryProvider.allTransitiveDependencies,
      },
    );

typedef _$StatsController = AutoDisposeAsyncNotifier<List<CategoryModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
