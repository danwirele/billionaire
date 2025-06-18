// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_transactions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyTransactionsHash() =>
    r'03e4ce0e5c66f9a68054a2b8c223f4348773b87d';

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

abstract class _$HistoryTransactions
    extends BuildlessAutoDisposeAsyncNotifier<HistoryTransactionStateModel?> {
  late final bool isIncome;

  FutureOr<HistoryTransactionStateModel?> build({required bool isIncome});
}

/// See also [HistoryTransactions].
@ProviderFor(HistoryTransactions)
const historyTransactionsProvider = HistoryTransactionsFamily();

/// See also [HistoryTransactions].
class HistoryTransactionsFamily
    extends Family<AsyncValue<HistoryTransactionStateModel?>> {
  /// See also [HistoryTransactions].
  const HistoryTransactionsFamily();

  /// See also [HistoryTransactions].
  HistoryTransactionsProvider call({required bool isIncome}) {
    return HistoryTransactionsProvider(isIncome: isIncome);
  }

  @override
  HistoryTransactionsProvider getProviderOverride(
    covariant HistoryTransactionsProvider provider,
  ) {
    return call(isIncome: provider.isIncome);
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    historyTransactionsRepositoryProvider,
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
        historyTransactionsRepositoryProvider,
        ...?historyTransactionsRepositoryProvider.allTransitiveDependencies,
      };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'historyTransactionsProvider';
}

/// See also [HistoryTransactions].
class HistoryTransactionsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          HistoryTransactions,
          HistoryTransactionStateModel?
        > {
  /// See also [HistoryTransactions].
  HistoryTransactionsProvider({required bool isIncome})
    : this._internal(
        () => HistoryTransactions()..isIncome = isIncome,
        from: historyTransactionsProvider,
        name: r'historyTransactionsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$historyTransactionsHash,
        dependencies: HistoryTransactionsFamily._dependencies,
        allTransitiveDependencies:
            HistoryTransactionsFamily._allTransitiveDependencies,
        isIncome: isIncome,
      );

  HistoryTransactionsProvider._internal(
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
  FutureOr<HistoryTransactionStateModel?> runNotifierBuild(
    covariant HistoryTransactions notifier,
  ) {
    return notifier.build(isIncome: isIncome);
  }

  @override
  Override overrideWith(HistoryTransactions Function() create) {
    return ProviderOverride(
      origin: this,
      override: HistoryTransactionsProvider._internal(
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
    HistoryTransactions,
    HistoryTransactionStateModel?
  >
  createElement() {
    return _HistoryTransactionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryTransactionsProvider && other.isIncome == isIncome;
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
mixin HistoryTransactionsRef
    on AutoDisposeAsyncNotifierProviderRef<HistoryTransactionStateModel?> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _HistoryTransactionsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          HistoryTransactions,
          HistoryTransactionStateModel?
        >
    with HistoryTransactionsRef {
  _HistoryTransactionsProviderElement(super.provider);

  @override
  bool get isIncome => (origin as HistoryTransactionsProvider).isIncome;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
