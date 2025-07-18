part of '../ui_kit.dart';

class BillionFAB extends StatelessWidget {
  const BillionFAB({
    required this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: onPressed,
      elevation: 0,
      backgroundColor: colorScheme.primary,
      foregroundColor: Colors.white,
      child: const Icon(Icons.add),
    );
  }
}
