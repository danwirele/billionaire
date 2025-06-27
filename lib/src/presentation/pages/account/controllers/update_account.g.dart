// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateAccountHash() => r'ef86bda9a782a64da73bc5d9e0d1051308af0ced';

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
