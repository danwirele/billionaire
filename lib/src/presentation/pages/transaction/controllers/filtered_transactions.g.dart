// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_transactions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTransactionsHash() =>
    r'5f20ee0106316161f71e88abba3f232c533670b4';

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

abstract class _$FilteredTransactions
    extends BuildlessAsyncNotifier<TransactionStateModel?> {
  late final bool isIncome;

  FutureOr<TransactionStateModel?> build({required bool isIncome});
}

/// See also [FilteredTransactions].
@ProviderFor(FilteredTransactions)
const filteredTransactionsProvider = FilteredTransactionsFamily();

/// See also [FilteredTransactions].
class FilteredTransactionsFamily
    extends Family<AsyncValue<TransactionStateModel?>> {
  /// See also [FilteredTransactions].
  const FilteredTransactionsFamily();

  /// See also [FilteredTransactions].
  FilteredTransactionsProvider call({required bool isIncome}) {
    return FilteredTransactionsProvider(isIncome: isIncome);
  }

  @override
  FilteredTransactionsProvider getProviderOverride(
    covariant FilteredTransactionsProvider provider,
  ) {
    return call(isIncome: provider.isIncome);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredTransactionsProvider';
}

/// See also [FilteredTransactions].
class FilteredTransactionsProvider
    extends
        AsyncNotifierProviderImpl<
          FilteredTransactions,
          TransactionStateModel?
        > {
  /// See also [FilteredTransactions].
  FilteredTransactionsProvider({required bool isIncome})
    : this._internal(
        () => FilteredTransactions()..isIncome = isIncome,
        from: filteredTransactionsProvider,
        name: r'filteredTransactionsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$filteredTransactionsHash,
        dependencies: FilteredTransactionsFamily._dependencies,
        allTransitiveDependencies:
            FilteredTransactionsFamily._allTransitiveDependencies,
        isIncome: isIncome,
      );

  FilteredTransactionsProvider._internal(
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
  FutureOr<TransactionStateModel?> runNotifierBuild(
    covariant FilteredTransactions notifier,
  ) {
    return notifier.build(isIncome: isIncome);
  }

  @override
  Override overrideWith(FilteredTransactions Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredTransactionsProvider._internal(
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
  AsyncNotifierProviderElement<FilteredTransactions, TransactionStateModel?>
  createElement() {
    return _FilteredTransactionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredTransactionsProvider && other.isIncome == isIncome;
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
mixin FilteredTransactionsRef
    on AsyncNotifierProviderRef<TransactionStateModel?> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _FilteredTransactionsProviderElement
    extends
        AsyncNotifierProviderElement<
          FilteredTransactions,
          TransactionStateModel?
        >
    with FilteredTransactionsRef {
  _FilteredTransactionsProviderElement(super.provider);

  @override
  bool get isIncome => (origin as FilteredTransactionsProvider).isIncome;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
