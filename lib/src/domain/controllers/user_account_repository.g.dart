// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userAccountRepositoryHash() =>
    r'7a6d0371d019ece0a5e8b322ca8d2997e07fb061';

/// See also [UserAccountRepository].
@ProviderFor(UserAccountRepository)
final userAccountRepositoryProvider =
    AsyncNotifierProvider<UserAccountRepository, AccountModel?>.internal(
      UserAccountRepository.new,
      name: r'userAccountRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userAccountRepositoryHash,
      dependencies: <ProviderOrFamily>[connectionProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        connectionProvider,
        ...?connectionProvider.allTransitiveDependencies,
      },
    );

typedef _$UserAccountRepository = AsyncNotifier<AccountModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
