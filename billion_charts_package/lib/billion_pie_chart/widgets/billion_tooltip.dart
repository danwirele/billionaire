part of '../billion_pie_chart_imports.dart';

class BillionTooltip extends StatelessWidget {
  const BillionTooltip({
    super.key,
    required this.coordsOffset,
    required this.radius,
    required this.touchedValue,
  });

  final Offset coordsOffset;
  final double radius;
  final double touchedValue;
  static const double toolTipWidth = 46;
  static const double toolTipHeight = 30;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _calculateTooltipPositionDx(
        coordsOffset,
        radius,
        toolTipWidth,
      ),
      top: _calculateTooltipPositionDy(
        coordsOffset,
        radius,
        toolTipHeight,
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.blueGrey,
        ),
        child: Text(
          '$touchedValue%',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  double _calculateTooltipPositionDy(
    Offset offset,
    double radius,
    double height,
  ) {
    if (offset.dy + height > radius * 2) {
      return offset.dy - height;
    }
    return offset.dy;
  }

  double _calculateTooltipPositionDx(
    Offset offset,
    double radius,
    double width,
  ) {
    if (offset.dx + width > radius * 2) {
      return offset.dx - width;
    }
    return offset.dx;
  }
}
