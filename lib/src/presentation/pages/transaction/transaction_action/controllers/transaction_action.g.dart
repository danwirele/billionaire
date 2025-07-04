// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_action.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionActionHash() => r'fe7aea02372d86aed23594c617604657fb7e7edc';

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

abstract class _$TransactionAction
    extends BuildlessAutoDisposeNotifier<TransactionResponseModel?> {
  late final TransactionResponseModel? model;

  TransactionResponseModel? build({required TransactionResponseModel? model});
}

/// See also [TransactionAction].
@ProviderFor(TransactionAction)
const transactionActionProvider = TransactionActionFamily();

/// See also [TransactionAction].
class TransactionActionFamily extends Family<TransactionResponseModel?> {
  /// See also [TransactionAction].
  const TransactionActionFamily();

  /// See also [TransactionAction].
  TransactionActionProvider call({required TransactionResponseModel? model}) {
    return TransactionActionProvider(model: model);
  }

  @override
  TransactionActionProvider getProviderOverride(
    covariant TransactionActionProvider provider,
  ) {
    return call(model: provider.model);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'transactionActionProvider';
}

/// See also [TransactionAction].
class TransactionActionProvider
    extends
        AutoDisposeNotifierProviderImpl<
          TransactionAction,
          TransactionResponseModel?
        > {
  /// See also [TransactionAction].
  TransactionActionProvider({required TransactionResponseModel? model})
    : this._internal(
        () => TransactionAction()..model = model,
        from: transactionActionProvider,
        name: r'transactionActionProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$transactionActionHash,
        dependencies: TransactionActionFamily._dependencies,
        allTransitiveDependencies:
            TransactionActionFamily._allTransitiveDependencies,
        model: model,
      );

  TransactionActionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final TransactionResponseModel? model;

  @override
  TransactionResponseModel? runNotifierBuild(
    covariant TransactionAction notifier,
  ) {
    return notifier.build(model: model);
  }

  @override
  Override overrideWith(TransactionAction Function() create) {
    return ProviderOverride(
      origin: this,
      override: TransactionActionProvider._internal(
        () => create()..model = model,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    TransactionAction,
    TransactionResponseModel?
  >
  createElement() {
    return _TransactionActionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionActionProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TransactionActionRef
    on AutoDisposeNotifierProviderRef<TransactionResponseModel?> {
  /// The parameter `model` of this provider.
  TransactionResponseModel? get model;
}

class _TransactionActionProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          TransactionAction,
          TransactionResponseModel?
        >
    with TransactionActionRef {
  _TransactionActionProviderElement(super.provider);

  @override
  TransactionResponseModel? get model =>
      (origin as TransactionActionProvider).model;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
