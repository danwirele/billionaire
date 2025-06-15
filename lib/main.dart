import 'dart:async';
import 'dart:developer' show log;

import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageUtils {
  static void svgPrecacheImage() {
    final cacheSvgImages = Assets.icons.values
        .map((e) => e.path)
        .toList();
    // Assets.icons.account.path,
    // Assets.icons.edit.path,
    // Assets.icons.expenseStats.path,
    // Assets.icons.moreVert.path,
    // Assets.icons.settings.path,
    // Assets.icons.trendDown.path,
    // Assets.icons.trendUp.path,

    for (String element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache.putIfAbsent(
        loader.cacheKey(null),
        () => loader.loadBytes(null),
      );
    }
  }
}

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
      ImageUtils.svgPrecacheImage();
      runApp(const App());
    },
    (error, st) {
      log('call(runZoneGuarded) $error $st');
    },
  );
}

// import 'package:billionaire/core/l10n/app_localizations.dart';
// import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_fab.dart';
// import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_app_bar.dart';
// import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_pinned_container.dart';
// import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_scaffold.dart';
// import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_stat_widget.dart';
// import 'package:billionaire/src/presentation/ui_kit/theme/billion_colors.dart';
// import 'package:flutter/material.dart';

// class ExpensesPage extends StatelessWidget {
//   const ExpensesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BillionScaffold(
//       appBar: BillionAppBar(
//         title: AppLocalizations.of(context)!.appBarExpenses,
//         actionIcon: GestureDetector(
//           onTap: () {},
//           child: Icon(
//             Icons.history,
//             size: 24,
//             color: BillionColors.onSurfaceVariant,
//           ),
//         ),
//       ),
//       floatingActionButton: BillionFAB(onPressed: () {}),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: CustomScrollView(
//                 controller: ScrollController(),
//                 slivers: [
//                   SliverPersistentHeader(
//                     pinned: true,
//                     delegate: PersistentHeader(
//                       widget: BillionPinnedContainer(
//                         leadingText: 'Всего',
//                         actionText: '436 568 ₽',
//                       ),
//                     ),
//                   ),

//                   SliverToBoxAdapter(
//                     child: BillionPinnedContainer(
//                       leadingText: 'Всего',
//                       actionText: '436 568 ₽',
//                     ),
//                   ),
//                   SliverAnimatedList(
//                     initialItemCount: 10,

//                     itemBuilder: (context, index, animation) =>
//                         BillionStatWidget(
//                           leadingEmoji: Text('4'),
//                           statTitle: 'Пет $index',
//                           transactionAmount: '100 000 ₽',
//                         ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PersistentHeader extends SliverPersistentHeaderDelegate {
//   final Widget widget;
//   PersistentHeader({required this.widget});

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     return widget;
//   }

//   @override
//   double get maxExtent => 56.0;
//   @override
//   double get minExtent => 56.0;
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
