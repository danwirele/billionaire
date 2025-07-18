import 'package:billionaire/src/presentation/pages/auth/controller/pincode_page_controller.dart';
import 'package:billionaire/src/presentation/pages/auth/widgets/billion_pinput.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PincodePage extends ConsumerWidget {
  const PincodePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pincodePageNotifier = ref.read(
      pincodePageControllerProvider.notifier,
    );

    final bottomPadding = MediaQuery.sizeOf(context).height / 10;
    return BillionScaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Center(
          child: ref
              .watch(pincodePageControllerProvider)
              .when(
                data: (data) {
                  switch (data) {
                    case PincodePageEnum.set:
                      return BillionPinput(
                        onComplete: (value) async {
                          await pincodePageNotifier.setTempPass(
                            pinCode: value,
                          );
                          return true;
                        },
                        title: context.localization.setPassword,
                      );
                    case PincodePageEnum.edit:
                      return BillionPinput(
                        onComplete: (value) async {
                          await pincodePageNotifier.setTempPass(
                            pinCode: value,
                          );
                          return true;
                        },
                        title: context.localization.enterNewPassword,
                      );
                    case PincodePageEnum.confirmation:
                      return BillionPinput(
                        onComplete: (value) async {
                          final result = await pincodePageNotifier
                              .setPass(
                                pinCode: value,
                              );
                          if (!result) return false;
                          await Future<void>.delayed(
                            Durations.short4,
                          );

                          if (context.mounted) {
                            GoRouter.of(context).pop();
                          }
                          return true;
                        },
                        title: context
                            .localization
                            .confirmYourNewPassword,
                      );
                  }
                },
                error: (error, stackTrace) {
                  return Text(
                    context.localization.sorryErrorOccurred,
                  );
                },
                loading: () => const CircularProgressIndicator(),
              ),
        ),
      ),
    );
  }
}
