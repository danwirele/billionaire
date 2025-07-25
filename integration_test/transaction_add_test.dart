import 'package:billionaire/core/config/config.dart';
import 'package:billionaire/src/app.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/widgets/choose_amount.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/widgets/choose_category.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolSetUp(
    () async {
      await Config().init();
    },
  );

  patrolTearDown(
    () {},
  );
  patrolTest(
    'Интеграционный тест добавления транзакции',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    (tester) async {
      await tester.pumpWidgetAndSettle(
        const ProviderScope(child: App()),
      );
      await tester('Income').tap();

      await tester(Icons.add).tap();

      expect(tester(ChooseCategory).visible, isTrue);
      await tester(ChooseCategory).tap();

      expect(tester(BillionStatWidget).visible, isTrue);
      await tester(BillionStatWidget).tap();

      expect(tester(ChooseAmount).visible, isTrue);
      await tester(ChooseAmount).tap();

      await tester.enterText(tester(TextField), '123');

      await tester('Save').tap();

      await tester.native2.pressBack();

      await tester(Icons.check).tap();
      // await tester('Category').tap();
      // await tester('Зарплата').tap();
      await Future<void>.delayed(const Duration(seconds: 10));
    },
  );
}
