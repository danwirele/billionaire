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
    final sortedLegends =
        legends.where((legend) => legend.percentage > 0).toList()
          ..sort((a, b) => b.percentage.compareTo(a.percentage));
    final topLegends = sortedLegends.take(8).toList();

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
          children: List.generate(topLegends.length, (index) {
            final legend = topLegends[index];
            return SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 3.3,
                  ), // Добавляем отступ слева
                  CircleAvatar(
                    backgroundColor: legend.sectionColor,
                    radius: 3.5,
                  ),
                  const SizedBox(
                    width: 3.3,
                  ), // Отступ между кругом и текстом
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
