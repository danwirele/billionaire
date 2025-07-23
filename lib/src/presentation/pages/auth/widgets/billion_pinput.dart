import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class BillionPinput extends StatefulWidget {
  const BillionPinput({
    required this.title,
    required this.onComplete,
    super.key,
    this.footer,
  });
  final Future<bool> Function(String value) onComplete;
  final String title;
  final Widget? footer;
  @override
  State<BillionPinput> createState() => _BillionPinputState();
}

class _BillionPinputState extends State<BillionPinput> {
  final TextEditingController textEditingController =
      TextEditingController();

  bool _errorState = false;

  @override
  void didUpdateWidget(covariant BillionPinput oldWidget) {
    super.didUpdateWidget(oldWidget);
    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: context.textTheme.titleMedium,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        color: context.colorScheme.primaryContainer,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        BillionText.titleLarge(widget.title),
        Pinput(
          obscureText: true,
          length: 4,
          controller: textEditingController,
          onCompleted: (value) async {
            if (value.length != 4) return;
            final result = await widget.onComplete(value);
            setState(() {
              _errorState = !result;
            });
          },
          onSubmitted: (value) async {
            if (value.length != 4) return;
            final result = await widget.onComplete(value);
            setState(() {
              _errorState = !result;
            });
          },
          onChanged: (value) {
            if (value.length < 4 && _errorState) {
              setState(() {
                _errorState = false;
              });
            }
          },

          errorText: context.localization.invalidPassword,
          focusedPinTheme: defaultPinTheme,
          disabledPinTheme: defaultPinTheme,
          followingPinTheme: defaultPinTheme,
          submittedPinTheme: defaultPinTheme,
          errorPinTheme: defaultPinTheme.copyDecorationWith(
            color: context.colorScheme.error,
          ),
          forceErrorState: _errorState,
        ),
        ?widget.footer,
      ],
    );
  }
}
