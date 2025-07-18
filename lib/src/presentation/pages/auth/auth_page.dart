import 'dart:developer';

import 'package:billionaire/src/presentation/pages/auth/controller/auth_page_controller.dart';
import 'package:billionaire/src/presentation/pages/auth/widgets/billion_pinput.dart';
import 'package:billionaire/src/presentation/shared/controllers/auth.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final authOverlayGuardProvider =
    StateNotifierProvider<AuthOverlayGuard, bool>(
      (ref) => AuthOverlayGuard(),
    );

class AuthOverlayGuard extends StateNotifier<bool> {
  AuthOverlayGuard() : super(false);

  void setAuthActive({required bool isActive}) {
    state = isActive;
  }
}

class AuthPage extends ConsumerWidget {
  AuthPage({super.key});

  final LocalAuthentication _localAuthentication =
      LocalAuthentication();

  Future<void> _authenticateWithBiometrics(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      ref
          .read(authOverlayGuardProvider.notifier)
          .setAuthActive(isActive: true);

      final isAuthenticated = await _localAuthentication.authenticate(
        localizedReason: context.localization.logInBiometricsReason,
        options: const AuthenticationOptions(
          useErrorDialogs: true,
        ),
      );

      ref
          .read(authOverlayGuardProvider.notifier)
          .setAuthActive(isActive: false);

      if (isAuthenticated) {
        await ref.read(authProvider.notifier).biometricsLogIn();
        if (context.mounted) {
          await GoRouter.of(
            context,
          ).pushReplacementNamed(RoutesUtil.accountPageName);
        }
      } else {
        // Пользователь отменил аутентификацию
        ref
            .read(authPageControllerProvider.notifier)
            .setPincodeLoginType();
      }
    } on PlatformException catch (e) {
      log(e.toString());
      if (context.mounted) {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: BillionText.titleLarge(
                context.localization.sorryErrorOccurred,
              ),
              content: BillionText.bodyMedium(
                context.localization.noBiometrics,
                overflow: TextOverflow.visible,
              ),
              actions: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(context.localization.close),
                ),
              ],
            );
          },
        );
      }
      ref
          .read(authPageControllerProvider.notifier)
          .setPincodeLoginType();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = context.colorScheme;
    final authNotifier = ref.read(authProvider.notifier);
    ref.listen<AsyncValue<AuthLoginType>>(
      authPageControllerProvider,
      (previous, next) async {
        if (next.valueOrNull == AuthLoginType.biometrics) {
          await _authenticateWithBiometrics(context, ref);
        }
      },
    );
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: ref
            .watch(authPageControllerProvider)
            .when(
              data: (loginType) {
                switch (loginType) {
                  case AuthLoginType.biometrics:
                    return const _BiometricLoadingIndicator();

                  case AuthLoginType.pincode:
                    return BillionPinput(
                      onComplete: (value) async {
                        final isValid = await authNotifier
                            .validatePincode(pinCode: value);
                        if (!isValid) return false;

                        await Future<void>.delayed(
                          Durations.short4,
                        ); // чтобы анимация не дергалась

                        if (context.mounted) {
                          await GoRouter.of(
                            context,
                          ).pushReplacementNamed(
                            RoutesUtil.accountPageName,
                          );
                        }
                        return true;
                      },
                      title: context.localization.enterYourPassword,
                      footer:
                          FutureBuilder<
                            ({
                              List<BiometricType> biometrics,
                              bool isBiometricsEnabled,
                            })
                          >(
                            future: () async {
                              final biometrics =
                                  await _localAuthentication
                                      .getAvailableBiometrics();
                              final isBiometricsEnabled =
                                  await authNotifier
                                      .isBiometricsEnabled();
                              return (
                                biometrics: biometrics,
                                isBiometricsEnabled:
                                    isBiometricsEnabled,
                              );
                            }(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final biometrics =
                                    snapshot.data!.biometrics;
                                final isBiometricsEnabled = snapshot
                                    .data!
                                    .isBiometricsEnabled;

                                if (biometrics.isNotEmpty &&
                                    isBiometricsEnabled) {
                                  return TextButton(
                                    onPressed: () {
                                      ref
                                          .read(
                                            authPageControllerProvider
                                                .notifier,
                                          )
                                          .setBiometricsLoginType();
                                    },
                                    child: Text(
                                      context
                                          .localization
                                          .loginBiometrics,
                                    ),
                                  );
                                }
                              }

                              return const SizedBox.shrink();
                            },
                          ),
                    );
                }
              },
              skipLoadingOnRefresh: true,
              skipLoadingOnReload: true,
              error: (error, stackTrace) =>
                  Text(context.localization.error),
              loading: () => const CircularProgressIndicator(),
            ),
      ),
    );
  }
}

class _BiometricLoadingIndicator extends StatelessWidget {
  const _BiometricLoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text('${context.localization.checkingBiometrics}...'),
      ],
    );
  }
}
