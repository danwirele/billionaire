part of '../ui_kit.dart';

class BillionArrowRight extends StatelessWidget {
  const BillionArrowRight({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Assets.icons.moreVert.svg(
      colorFilter: ColorFilter.mode(
        colorScheme.tertiary.withValues(
          alpha: 0.3,
        ),
        BlendMode.srcIn,
      ),
    );
  }
}
