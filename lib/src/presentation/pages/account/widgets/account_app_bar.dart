import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/pages/account/controllers/update_account.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/dialogs_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/error_helper.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AccountAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(BillionAppBar.sizeAppBar);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return PreferredSize(
      preferredSize: const Size.fromHeight(
        BillionAppBar.sizeAppBar,
      ),
      child: Consumer(
        builder: (context, ref, child) {
          return ref
              .watch(updateAccountProvider)
              .when(
                data: (data) {
                  if (data == null) {
                    return BillionAppBar(
                      title: context.localization.accountNotFound,
                      actionIcon: IconButton(
                        onPressed: () {},
                        icon: Assets.icons.edit.svg(
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            colorScheme.onSurfaceVariant,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    );
                  }

                  return BillionAppBar(
                    title: data.name,
                    actionIcon: IconButton(
                      onPressed: () async {
                        await context.showChangeAccountNameDialog(
                          data,
                        );
                      },
                      icon: Assets.icons.edit.svg(
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          colorScheme.onSurfaceVariant,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  );
                },
                error: (error, stackTrace) {
                  final errorMessage = context.whenError(error);

                  return BillionAppBar(
                    title: errorMessage,
                    actionIcon: IconButton(
                      onPressed: () {},
                      icon: Assets.icons.edit.svg(
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          colorScheme.onSurfaceVariant,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  );
                },
                loading: () => BillionAppBar(
                  title: '${context.localization.loading}...',
                  actionIcon: IconButton(
                    onPressed: () {},
                    icon: Assets.icons.edit.svg(
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onSurfaceVariant,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              );
        },
      ),
    );
  }
}
