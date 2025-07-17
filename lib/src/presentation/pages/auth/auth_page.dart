import 'package:billionaire/src/presentation/pages/auth/widgets/billion_pinput.dart';
import 'package:billionaire/src/presentation/shared/controllers/auth.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = context.colorScheme;
    final authNotifier = ref.read(authProvider.notifier);
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: BillionPinput(
          onComplete: (value) async {
            final isValid = await authNotifier.validatePincode(
              pinCode: value,
            );
            print(isValid);
            if (!isValid) return;

            //! ЧТО БЫ АНИМАЦИЯ НЕ ДЕРГАЛАСЬ)
            await Future<void>.delayed(Durations.short4);

            if (context.mounted) {
              await GoRouter.of(
                context,
              ).pushReplacementNamed(RoutesUtil.accountPageName);
            }
          },
          title: 'Введите ваш пароль',
        ),
      ),
    );
  }
}
