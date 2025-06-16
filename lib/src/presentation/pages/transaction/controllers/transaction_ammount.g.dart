// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_ammount.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionAmmountHash() =>
    r'c31ae8d8ea402f441bd410bfb60654ae7f8323a9';

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

abstract class _$TransactionAmmount
    extends BuildlessAutoDisposeAsyncNotifier<double?> {
  late final bool isIncome;

  FutureOr<double?> build({required bool isIncome});
}

/// See also [TransactionAmmount].
@ProviderFor(TransactionAmmount)
const transactionAmmountProvider = TransactionAmmountFamily();

/// See also [TransactionAmmount].
class TransactionAmmountFamily extends Family<AsyncValue<double?>> {
  /// See also [TransactionAmmount].
  const TransactionAmmountFamily();

  /// See also [TransactionAmmount].
  TransactionAmmountProvider call({required bool isIncome}) {
    return TransactionAmmountProvider(isIncome: isIncome);
  }

  @override
  TransactionAmmountProvider getProviderOverride(
    covariant TransactionAmmountProvider provider,
  ) {
    return call(isIncome: provider.isIncome);
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    filteredTransactionsProvider,
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
        filteredTransactionsProvider,
        ...?filteredTransactionsProvider.allTransitiveDependencies,
      };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'transactionAmmountProvider';
}

/// See also [TransactionAmmount].
class TransactionAmmountProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TransactionAmmount, double?> {
  /// See also [TransactionAmmount].
  TransactionAmmountProvider({required bool isIncome})
    : this._internal(
        () => TransactionAmmount()..isIncome = isIncome,
        from: transactionAmmountProvider,
        name: r'transactionAmmountProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$transactionAmmountHash,
        dependencies: TransactionAmmountFamily._dependencies,
        allTransitiveDependencies:
            TransactionAmmountFamily._allTransitiveDependencies,
        isIncome: isIncome,
      );

  TransactionAmmountProvider._internal(
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
  FutureOr<double?> runNotifierBuild(covariant TransactionAmmount notifier) {
    return notifier.build(isIncome: isIncome);
  }

  @override
  Override overrideWith(TransactionAmmount Function() create) {
    return ProviderOverride(
      origin: this,
      override: TransactionAmmountProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<TransactionAmmount, double?>
  createElement() {
    return _TransactionAmmountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionAmmountProvider && other.isIncome == isIncome;
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
mixin TransactionAmmountRef on AutoDisposeAsyncNotifierProviderRef<double?> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _TransactionAmmountProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TransactionAmmount, double?>
    with TransactionAmmountRef {
  _TransactionAmmountProviderElement(super.provider);

  @override
  bool get isIncome => (origin as TransactionAmmountProvider).isIncome;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
