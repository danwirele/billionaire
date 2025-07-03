part of '../ui_kit.dart';

class BillionArrowRight extends StatelessWidget {
  const BillionArrowRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.icons.moreVert.svg(
      colorFilter: ColorFilter.mode(
        BillionColors.tertiary.withValues(
          alpha: 0.3,
        ),
        BlendMode.srcIn,
      ),
    );
  }
}
