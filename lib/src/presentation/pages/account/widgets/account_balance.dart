import 'dart:async';
import 'dart:ui';

import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/domain/controllers/user_account_repository.dart';
import 'package:billionaire/src/presentation/pages/account/controllers/balance_visibility.dart';
import 'package:billionaire/src/presentation/shared/controllers/currency_provider.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';
import 'package:spoiler_widget/spoiler_widget.dart';

class AccountBalance extends ConsumerStatefulWidget {
  const AccountBalance({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AccountBalanceState();
}

class _AccountBalanceState extends ConsumerState<AccountBalance> {
  ShakeDetector? _detector;
  StreamSubscription<AccelerometerEvent>? _accelerometerSub;
  bool _isUpsideDown = false;

  @override
  void initState() {
    super.initState();
    _startDetector();
  }

  void _startDetector() {
    _detector?.stopListening();

    _detector = ShakeDetector.autoStart(
      minimumShakeCount: 2,
      shakeSlopTimeMS: 300,
      onPhoneShake: (ShakeEvent event) {
        ref.read(balanceVisibilityProvider.notifier).toggle();
      },
    );

    // Подписываемся на события акселерометра
    _accelerometerSub = accelerometerEventStream().listen((
      AccelerometerEvent event,
    ) {
      // Определяем, перевёрнуто ли устройство
      final isCurrentlyUpsideDown = event.z < -8.0;

      // Проверяем, изменилось ли состояние
      if (isCurrentlyUpsideDown != _isUpsideDown) {
        _isUpsideDown = isCurrentlyUpsideDown;

        if (_isUpsideDown) {
          ref.read(balanceVisibilityProvider.notifier).toggle();
        }
      }
    });
  }

  @override
  void dispose() {
    _detector?.stopListening();
    _accelerometerSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currency = ref.watch(currencyProviderProvider);
    return BillionPinnedContainer(
      leading: const Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 12,
            child: Text('💰'),
          ),
          BillionText.bodyLarge('Баланс'),
        ],
      ),
      action: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ref
              .watch(
                userAccountRepositoryProvider,
              )
              .when(
                data: (data) {
                  if (data == null) {
                    return const Text('Аккаунт не найден');
                  }

                  final balance = double.parse(
                    data.balance,
                  ).formatNumber();

                  return Consumer(
                    builder: (context, ref, child) {
                      final isVisible = ref.watch(
                        balanceVisibilityProvider,
                      );

                      return SpoilerOverlay(
                        config: WidgetSpoilerConfig(
                          particleColor: BillionColors.error,
                          fadeRadius: 30,
                          maxParticleSize: 3,
                          particleDensity: 0.4,
                          isEnabled: isVisible,
                          enableFadeAnimation: true,
                          enableGestureReveal: true,
                          imageFilter: ImageFilter.blur(
                            sigmaX: 2,
                            sigmaY: 2,
                          ),
                          // particleColor: Colors.red,
                          // isEnabled: !isVisible,
                          // fadeRadius: 0,
                          // enableFadeAnimation: true,
                          // enableGestureReveal: true,
                          // particleDensity: 8,
                          // particleSpeed: 0.1,
                          // imageFilter: ImageFilter.blur(
                          //   sigmaX: 15,
                          //   sigmaY: 15,
                          // ),
                        ),
                        child: Opacity(
                          opacity: isVisible ? 0 : 1,
                          child: BillionText.bodyLarge(
                            '$balance  ${currency.char}',
                          ),
                        ),
                      );
                    },
                  );
                },
                error: (error, stackTrace) =>
                    const BillionText.bodyLarge('Произошла ошибка'),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),

          const SizedBox(width: 16),
          SvgPicture.asset(
            Assets.icons.moreVert.path,
            colorFilter: ColorFilter.mode(
              BillionColors.tertiary.withValues(
                alpha: 0.3,
              ),
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
