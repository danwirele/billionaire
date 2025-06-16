part of '../ui_kit.dart';

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
