part of '../billion_pie_chart_imports.dart';

class LegendItem extends StatelessWidget {
  const LegendItem({
    required this.color,
    required this.label,
    super.key,
  });
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
