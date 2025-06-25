// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analysisStateHash() => r'1893c7d751c9f3657caf5f4957fb5a27f2a3a443';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AnalysisState
    extends BuildlessAutoDisposeAsyncNotifier<AnalyticsPageStateModel?> {
  late final bool isIncome;

  FutureOr<AnalyticsPageStateModel?> build({required bool isIncome});
}

/// See also [AnalysisState].
@ProviderFor(AnalysisState)
const analysisStateProvider = AnalysisStateFamily();

/// See also [AnalysisState].
class AnalysisStateFamily extends Family<AsyncValue<AnalyticsPageStateModel?>> {
  /// See also [AnalysisState].
  const AnalysisStateFamily();

  /// See also [AnalysisState].
  AnalysisStateProvider call({required bool isIncome}) {
    return AnalysisStateProvider(isIncome: isIncome);
  }

  @override
  AnalysisStateProvider getProviderOverride(
    covariant AnalysisStateProvider provider,
  ) {
    return call(isIncome: provider.isIncome);
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    analysisTransactionsRepositoryProvider,
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
        analysisTransactionsRepositoryProvider,
        ...?analysisTransactionsRepositoryProvider.allTransitiveDependencies,
      };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'analysisStateProvider';
}

/// See also [AnalysisState].
class AnalysisStateProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          AnalysisState,
          AnalyticsPageStateModel?
        > {
  /// See also [AnalysisState].
  AnalysisStateProvider({required bool isIncome})
    : this._internal(
        () => AnalysisState()..isIncome = isIncome,
        from: analysisStateProvider,
        name: r'analysisStateProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$analysisStateHash,
        dependencies: AnalysisStateFamily._dependencies,
        allTransitiveDependencies:
            AnalysisStateFamily._allTransitiveDependencies,
        isIncome: isIncome,
      );

  AnalysisStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isIncome,
  }) : super.internal();

  final bool isIncome;

  @override
  FutureOr<AnalyticsPageStateModel?> runNotifierBuild(
    covariant AnalysisState notifier,
  ) {
    return notifier.build(isIncome: isIncome);
  }

  @override
  Override overrideWith(AnalysisState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AnalysisStateProvider._internal(
        () => create()..isIncome = isIncome,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isIncome: isIncome,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    AnalysisState,
    AnalyticsPageStateModel?
  >
  createElement() {
    return _AnalysisStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnalysisStateProvider && other.isIncome == isIncome;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isIncome.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AnalysisStateRef
    on AutoDisposeAsyncNotifierProviderRef<AnalyticsPageStateModel?> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _AnalysisStateProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          AnalysisState,
          AnalyticsPageStateModel?
        >
    with AnalysisStateRef {
  _AnalysisStateProviderElement(super.provider);

  @override
  bool get isIncome => (origin as AnalysisStateProvider).isIncome;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
