// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_transactions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountTransactionsRepositoryHash() =>
    r'0290bd5b29debb794da73a554c8a95a5ca961586';

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

abstract class _$AccountTransactionsRepository
    extends BuildlessAutoDisposeAsyncNotifier<List<TransactionResponseModel>?> {
  late final bool isIncome;

  FutureOr<List<TransactionResponseModel>?> build({required bool isIncome});
}

/// See also [AccountTransactionsRepository].
@ProviderFor(AccountTransactionsRepository)
const accountTransactionsRepositoryProvider =
    AccountTransactionsRepositoryFamily();

/// See also [AccountTransactionsRepository].
class AccountTransactionsRepositoryFamily
    extends Family<AsyncValue<List<TransactionResponseModel>?>> {
  /// See also [AccountTransactionsRepository].
  const AccountTransactionsRepositoryFamily();

  /// See also [AccountTransactionsRepository].
  AccountTransactionsRepositoryProvider call({required bool isIncome}) {
    return AccountTransactionsRepositoryProvider(isIncome: isIncome);
  }

  @override
  AccountTransactionsRepositoryProvider getProviderOverride(
    covariant AccountTransactionsRepositoryProvider provider,
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
  String? get name => r'accountTransactionsRepositoryProvider';
}

/// See also [AccountTransactionsRepository].
class AccountTransactionsRepositoryProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          AccountTransactionsRepository,
          List<TransactionResponseModel>?
        > {
  /// See also [AccountTransactionsRepository].
  AccountTransactionsRepositoryProvider({required bool isIncome})
    : this._internal(
        () => AccountTransactionsRepository()..isIncome = isIncome,
        from: accountTransactionsRepositoryProvider,
        name: r'accountTransactionsRepositoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$accountTransactionsRepositoryHash,
        dependencies: AccountTransactionsRepositoryFamily._dependencies,
        allTransitiveDependencies:
            AccountTransactionsRepositoryFamily._allTransitiveDependencies,
        isIncome: isIncome,
      );

  AccountTransactionsRepositoryProvider._internal(
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
    covariant AccountTransactionsRepository notifier,
  ) {
    return notifier.build(isIncome: isIncome);
  }

  @override
  Override overrideWith(AccountTransactionsRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: AccountTransactionsRepositoryProvider._internal(
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
    AccountTransactionsRepository,
    List<TransactionResponseModel>?
  >
  createElement() {
    return _AccountTransactionsRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountTransactionsRepositoryProvider &&
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
mixin AccountTransactionsRepositoryRef
    on AutoDisposeAsyncNotifierProviderRef<List<TransactionResponseModel>?> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _AccountTransactionsRepositoryProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          AccountTransactionsRepository,
          List<TransactionResponseModel>?
        >
    with AccountTransactionsRepositoryRef {
  _AccountTransactionsRepositoryProviderElement(super.provider);

  @override
  bool get isIncome =>
      (origin as AccountTransactionsRepositoryProvider).isIncome;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
