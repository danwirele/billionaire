// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateAccountHash() => r'40f2d0c86d98c6a29b2c3bb273e8105d3d82a5c1';

/// See also [UpdateAccount].
@ProviderFor(UpdateAccount)
final updateAccountProvider =
    AutoDisposeAsyncNotifierProvider<UpdateAccount, AccountModel?>.internal(
      UpdateAccount.new,
      name: r'updateAccountProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$updateAccountHash,
      dependencies: <ProviderOrFamily>[userAccountRepositoryProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        userAccountRepositoryProvider,
        ...?userAccountRepositoryProvider.allTransitiveDependencies,
      },
    );

typedef _$UpdateAccount = AutoDisposeAsyncNotifier<AccountModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
