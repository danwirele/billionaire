part of '../billion_pie_chart_imports.dart';

class LegendContent extends StatelessWidget {
  const LegendContent({
    super.key,
    required this.radius,
    required this.legends,
  });

  final double radius;
  final List<LegendEntity> legends;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 2 * radius - 8,
          maxWidth: 2 * radius - 8,
          minHeight: 8,
          minWidth: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(legends.length, (index) {
            final legend = legends[index];
            return SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 3.3,
                children: [
                  CircleAvatar(
                    backgroundColor: legend.sectionColor,
                    radius: 3.5,
                  ),
                  Text(
                    '${legend.percentage.toStringAsFixed(0)}% ${legend.title}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 7,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
