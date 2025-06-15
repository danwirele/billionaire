import 'package:billionaire/src/presentation/ui_kit/theme/billion_colors.dart';
import 'package:flutter/material.dart';

class BillionScaffold extends StatelessWidget {
  const BillionScaffold({
    super.key,
    this.floatingActionButton,
    required this.body,
    required this.appBar,
  });

  const BillionScaffold.fab({
    super.key,
    required this.floatingActionButton,
    required this.body,
    required this.appBar,
  });

  final Widget? floatingActionButton;
  final Widget body;
  final PreferredSizeWidget appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat,
      backgroundColor: BillionColors.surface,
    );
  }
}
