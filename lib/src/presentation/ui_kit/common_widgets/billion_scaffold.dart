part of '../ui_kit.dart';

class BillionScaffold extends StatelessWidget {
  const BillionScaffold({
    required this.body,
    required this.appBar,
    super.key,
    this.floatingActionButton,
  });

  const BillionScaffold.fab({
    required this.floatingActionButton,
    required this.body,
    required this.appBar,
    super.key,
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
