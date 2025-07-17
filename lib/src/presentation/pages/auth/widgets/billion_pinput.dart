import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pinput/pinput.dart';

class BillionPinput extends StatefulWidget {
  const BillionPinput({
    required this.title,
    required this.onComplete,
    super.key,
  });
  final Future<void> Function(String value) onComplete;
  final String title;

  @override
  State<BillionPinput> createState() => _BillionPinputState();
}

class _BillionPinputState extends State<BillionPinput> {
  final TextEditingController textEditingController =
      TextEditingController();

  @override
  void didUpdateWidget(covariant BillionPinput oldWidget) {
    print('312');

    super.didUpdateWidget(oldWidget);
    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        BillionText.titleLarge(widget.title),
        Pinput(
          length: 4,
          controller: textEditingController,
          onCompleted: (value) {
            if (value.length != 4) return;
            widget.onComplete(value);
          },
          onSubmitted: (value) {
            if (value.length != 4) return;
            widget.onComplete(value);
          },
          errorBuilder: (errorText, pin) {
            return const Text('Неверный пароль');
          },
        ),
      ],
    );
  }
}
