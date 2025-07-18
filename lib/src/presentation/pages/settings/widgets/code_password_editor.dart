import 'package:billionaire/src/data/services/secure_storage_service.dart';
import 'package:billionaire/src/presentation/pages/settings/widgets/settings_arrow.dart';
import 'package:billionaire/src/presentation/shared/controllers/auth.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

class CodePasswordEditor extends ConsumerStatefulWidget {
  const CodePasswordEditor({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CodePasswordEditorState();
}

class _CodePasswordEditorState
    extends ConsumerState<CodePasswordEditor> {
  final LocalAuthentication _localAuthentication =
      LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authProvider.notifier);
    final pincodeNotifier = ref.read(pincodeServiceProvider);
    return BillionPinnedContainer.transparentMedium(
      onTap: () {
        GoRouter.of(context).pushNamed(RoutesUtil.pincodePageName);
      },
      leading: BillionText.bodyLarge(context.localization.pinCode),
      action: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder(
            future: Future.wait([
              _localAuthentication.getAvailableBiometrics(),
              authNotifier.isBiometricsEnabled(),
              pincodeNotifier.passwordExists(),
            ]),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              // Получаем предыдущее значение из кэша, если оно есть
              final cachedData = snapshot.hasData
                  ? snapshot.data
                  : null;

              final availableBiometrics =
                  cachedData?.elementAt(0) as List<BiometricType>? ??
                  [];
              final isBiometricsEnabled =
                  cachedData?.elementAt(1) as bool? ?? false;

              final passwordExists =
                  cachedData?.elementAt(2) as bool? ?? false;

              final canUseBiometrics = availableBiometrics.isNotEmpty;

              return Switch.adaptive(
                value: isBiometricsEnabled && canUseBiometrics,
                onChanged: canUseBiometrics && passwordExists
                    ? (value) async {
                        if (value) {
                          await authNotifier.setBiometricsLogin();
                        } else {
                          await authNotifier.deleteBiometricsLogin();
                        }
                        setState(() {});
                      }
                    : null, // Если биометрия не доступна — свитч неактивен
              );
            },
          ),
          const SettingsArrow(),
        ],
      ),
    );
  }
}
