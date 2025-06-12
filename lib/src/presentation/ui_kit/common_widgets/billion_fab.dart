import 'package:billionaire/src/presentation/ui_kit/theme/billion_colors.dart';
import 'package:flutter/material.dart';

class BillionFAB extends StatelessWidget {
  const BillionFAB({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: onPressed,
      elevation: 0,
      backgroundColor: BillionColors.primary,
      foregroundColor: Colors.white,
      child: const Icon(Icons.add),
    );
  }
}
