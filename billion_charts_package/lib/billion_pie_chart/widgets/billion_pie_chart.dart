part of '../billion_pie_chart_imports.dart';

class BillionPieChart extends StatefulWidget {
  const BillionPieChart({super.key, required this.config});

  final BillionPieChartConfig config;

  @override
  BillionPieChartState createState() => BillionPieChartState();
}

class BillionPieChartState extends State<BillionPieChart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Анимация прозрачности (fade out -> fade in)
    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _touchedValue = 0;
  Offset _touchedOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    final legends = widget.config.legends;
    final radius = widget.config.radius;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 2 * radius, maxWidth: 2 * radius),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotationAnimation.value,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      startDegreeOffset: -90,
                      sections: List.generate(legends.length, (index) {
                        final legend = legends[index];

                        return PieChartSectionData(value: legend.percentage, color: legend.sectionColor, radius: 8, showTitle: false);
                      }),
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (pieTouchResponse?.touchedSection?.touchedSection != null) {
                              _touchedValue = pieTouchResponse!.touchedSection!.touchedSection!.value;

                              _touchedOffset = pieTouchResponse.touchLocation;
                            } else {
                              _touchedValue = 0;
                              _touchedOffset = Offset.zero;
                            }
                          });
                        },
                      ),
                    ),
                  ),

                  LegendContent(radius: radius, legends: legends),

                  if (_touchedValue != 0 && _touchedOffset != Offset.zero)
                    BillionTooltip(coordsOffset: _touchedOffset, radius: radius, touchedValue: _touchedValue),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
