import 'package:billionaire/src/presentation/shared/controllers/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pincode_page_controller.g.dart';

enum PincodePageEnum { set, edit, confirmation }

@Riverpod(dependencies: [Auth])
class PincodePageController extends _$PincodePageController {
  String? _temPincode;

  @override
  FutureOr<PincodePageEnum> build() async {
    final hasPassword = await ref
        .read(authProvider.notifier)
        .hasPassword();
    _temPincode = null;
    return hasPassword ? PincodePageEnum.edit : PincodePageEnum.set;
  }

  Future<bool> setPass({required String pinCode}) async {
    final authNotifier = ref.read(authProvider.notifier);
    if (pinCode != _temPincode) return false;
    await authNotifier.setPass(pinCode: pinCode);

    state = const AsyncData(PincodePageEnum.confirmation);
    _temPincode = null;
    return true;
  }

  Future<bool> validatePincode({required String pinCode}) async {
    final authNotifier = ref.read(authProvider.notifier);

    final isSucces = await authNotifier.validatePincode(
      pinCode: pinCode,
    );

    return isSucces;
  }

  Future<void> setTempPass({required String pinCode}) async {
    if (pinCode.length != 4) return;

    _temPincode = pinCode;

    state = const AsyncData(PincodePageEnum.confirmation);
  }
}
