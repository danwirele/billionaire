import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/modal_bottom_sheet_extension.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionActionPage extends ConsumerWidget {
  const TransactionActionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BillionScaffold(
      appBar: BillionAppBar(
        title: 'добавление',
        actionIcon: IconButton(
          onPressed: () async {
            await GoRouter.of(context).pushNamed(
              RoutesUtil.historyPageName,
              pathParameters: {'isIncome': 'true'},
            );
          },
          icon: const Icon(
            Icons.history,
            size: 24,
            color: BillionColors.onSurfaceVariant,
          ),
        ),
      ),
      body: Column(
        children: [
          BillionPinnedContainer.transparentLarge(
            leading: const Text('Баланс'),
            action: Row(
              children: [
                Assets.icons.moreVert.svg(
                  colorFilter: ColorFilter.mode(
                    BillionColors.tertiary.withValues(
                      alpha: 0.3,
                    ),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),

          BillionPinnedContainer.transparentLarge(
            onTap: () async {
              final category = await context.showCategories();
              print(category);
            },
            leading: const Text('Статья'),
            action: Row(
              children: [
                Assets.icons.moreVert.svg(
                  colorFilter: ColorFilter.mode(
                    BillionColors.tertiary.withValues(
                      alpha: 0.3,
                    ),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          BillionPinnedContainer.transparentLarge(
            leading: const Text('Сумма'),
            action: Row(
              children: [
                Assets.icons.moreVert.svg(
                  colorFilter: ColorFilter.mode(
                    BillionColors.tertiary.withValues(
                      alpha: 0.3,
                    ),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          BillionPinnedContainer.transparentLarge(
            leading: const Text('Дата'),
            action: Row(
              children: [
                Assets.icons.moreVert.svg(
                  colorFilter: ColorFilter.mode(
                    BillionColors.tertiary.withValues(
                      alpha: 0.3,
                    ),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),

          BillionPinnedContainer.transparentLarge(
            leading: const Text('Время'),
            action: Row(
              children: [
                Assets.icons.moreVert.svg(
                  colorFilter: ColorFilter.mode(
                    BillionColors.tertiary.withValues(
                      alpha: 0.3,
                    ),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),

          BillionPinnedContainer.transparentLarge(
            leading: const Text('Описание'),
            action: Row(
              children: [
                Assets.icons.moreVert.svg(
                  colorFilter: ColorFilter.mode(
                    BillionColors.tertiary.withValues(
                      alpha: 0.3,
                    ),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
