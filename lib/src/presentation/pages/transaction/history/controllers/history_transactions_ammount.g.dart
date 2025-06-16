// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_transactions_ammount.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyTransactionsAmmountHash() =>
    r'2a59e6239cd7105fe1349dc08b0eda98242f637b';

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

abstract class _$HistoryTransactionsAmmount
    extends BuildlessAutoDisposeAsyncNotifier<double?> {
  late final bool isIncome;

  FutureOr<double?> build({required bool isIncome});
}

/// See also [HistoryTransactionsAmmount].
@ProviderFor(HistoryTransactionsAmmount)
const historyTransactionsAmmountProvider = HistoryTransactionsAmmountFamily();

/// See also [HistoryTransactionsAmmount].
class HistoryTransactionsAmmountFamily extends Family<AsyncValue<double?>> {
  /// See also [HistoryTransactionsAmmount].
  const HistoryTransactionsAmmountFamily();

  /// See also [HistoryTransactionsAmmount].
  HistoryTransactionsAmmountProvider call({required bool isIncome}) {
    return HistoryTransactionsAmmountProvider(isIncome: isIncome);
  }

  @override
  HistoryTransactionsAmmountProvider getProviderOverride(
    covariant HistoryTransactionsAmmountProvider provider,
  ) {
    return call(isIncome: provider.isIncome);
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    historyTransactionsProvider,
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
        historyTransactionsProvider,
        ...?historyTransactionsProvider.allTransitiveDependencies,
      };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'historyTransactionsAmmountProvider';
}

/// See also [HistoryTransactionsAmmount].
class HistoryTransactionsAmmountProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          HistoryTransactionsAmmount,
          double?
        > {
  /// See also [HistoryTransactionsAmmount].
  HistoryTransactionsAmmountProvider({required bool isIncome})
    : this._internal(
        () => HistoryTransactionsAmmount()..isIncome = isIncome,
        from: historyTransactionsAmmountProvider,
        name: r'historyTransactionsAmmountProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$historyTransactionsAmmountHash,
        dependencies: HistoryTransactionsAmmountFamily._dependencies,
        allTransitiveDependencies:
            HistoryTransactionsAmmountFamily._allTransitiveDependencies,
        isIncome: isIncome,
      );

  HistoryTransactionsAmmountProvider._internal(
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
  FutureOr<double?> runNotifierBuild(
    covariant HistoryTransactionsAmmount notifier,
  ) {
    return notifier.build(isIncome: isIncome);
  }

  @override
  Override overrideWith(HistoryTransactionsAmmount Function() create) {
    return ProviderOverride(
      origin: this,
      override: HistoryTransactionsAmmountProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<HistoryTransactionsAmmount, double?>
  createElement() {
    return _HistoryTransactionsAmmountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryTransactionsAmmountProvider &&
        other.isIncome == isIncome;
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
mixin HistoryTransactionsAmmountRef
    on AutoDisposeAsyncNotifierProviderRef<double?> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _HistoryTransactionsAmmountProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          HistoryTransactionsAmmount,
          double?
        >
    with HistoryTransactionsAmmountRef {
  _HistoryTransactionsAmmountProviderElement(super.provider);

  @override
  bool get isIncome => (origin as HistoryTransactionsAmmountProvider).isIncome;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
