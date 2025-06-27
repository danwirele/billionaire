import 'package:billionaire/src/presentation/pages/account/widgets/account_app_bar.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/account_balance.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/currency_selector.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BillionScaffold(
      appBar: const AccountAppBar(),
      floatingActionButton: BillionFAB(onPressed: () {}),
      body: const Column(
        children: [
          AccountBalance(),
          CurrencySelector(),
        ],
      ),
    );
  }
}
