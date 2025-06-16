// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_transactions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionsRepositoryHash() =>
    r'241f5cf50928e0c97ab72df68ed3ebea62e43648';

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

abstract class _$TransactionsRepository
    extends BuildlessAutoDisposeAsyncNotifier<List<TransactionResponseModel>?> {
  late final bool isIncome;

  FutureOr<List<TransactionResponseModel>?> build({required bool isIncome});
}

/// See also [TransactionsRepository].
@ProviderFor(TransactionsRepository)
const transactionsRepositoryProvider = TransactionsRepositoryFamily();

/// See also [TransactionsRepository].
class TransactionsRepositoryFamily
    extends Family<AsyncValue<List<TransactionResponseModel>?>> {
  /// See also [TransactionsRepository].
  const TransactionsRepositoryFamily();

  /// See also [TransactionsRepository].
  TransactionsRepositoryProvider call({required bool isIncome}) {
    return TransactionsRepositoryProvider(isIncome: isIncome);
  }

  @override
  TransactionsRepositoryProvider getProviderOverride(
    covariant TransactionsRepositoryProvider provider,
  ) {
    return call(isIncome: provider.isIncome);
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    userAccountRepositoryProvider,
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
        userAccountRepositoryProvider,
        ...?userAccountRepositoryProvider.allTransitiveDependencies,
      };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'transactionsRepositoryProvider';
}

/// See also [TransactionsRepository].
class TransactionsRepositoryProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          TransactionsRepository,
          List<TransactionResponseModel>?
        > {
  /// See also [TransactionsRepository].
  TransactionsRepositoryProvider({required bool isIncome})
    : this._internal(
        () => TransactionsRepository()..isIncome = isIncome,
        from: transactionsRepositoryProvider,
        name: r'transactionsRepositoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$transactionsRepositoryHash,
        dependencies: TransactionsRepositoryFamily._dependencies,
        allTransitiveDependencies:
            TransactionsRepositoryFamily._allTransitiveDependencies,
        isIncome: isIncome,
      );

  TransactionsRepositoryProvider._internal(
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
  FutureOr<List<TransactionResponseModel>?> runNotifierBuild(
    covariant TransactionsRepository notifier,
  ) {
    return notifier.build(isIncome: isIncome);
  }

  @override
  Override overrideWith(TransactionsRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: TransactionsRepositoryProvider._internal(
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
    TransactionsRepository,
    List<TransactionResponseModel>?
  >
  createElement() {
    return _TransactionsRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionsRepositoryProvider &&
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
mixin TransactionsRepositoryRef
    on AutoDisposeAsyncNotifierProviderRef<List<TransactionResponseModel>?> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _TransactionsRepositoryProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          TransactionsRepository,
          List<TransactionResponseModel>?
        >
    with TransactionsRepositoryRef {
  _TransactionsRepositoryProviderElement(super.provider);

  @override
  bool get isIncome => (origin as TransactionsRepositoryProvider).isIncome;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
