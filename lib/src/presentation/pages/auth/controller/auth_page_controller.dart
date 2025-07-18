import 'package:billionaire/src/presentation/shared/controllers/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_page_controller.g.dart';

enum AuthLoginType { biometrics, pincode }

@Riverpod()
class AuthPageController extends _$AuthPageController {
  @override
  FutureOr<AuthLoginType> build() async {
    final authProviderNotifier = ref.read(authProvider.notifier);
    final isBiometricsEnabled = await authProviderNotifier
        .isBiometricsEnabled();

    if (isBiometricsEnabled) return AuthLoginType.biometrics;
    return AuthLoginType.pincode;
  }

  void setBiometricsLoginType() {
    state = const AsyncData(AuthLoginType.biometrics);
  }

  void setPincodeLoginType() {
    state = const AsyncData(AuthLoginType.pincode);
  }
}
