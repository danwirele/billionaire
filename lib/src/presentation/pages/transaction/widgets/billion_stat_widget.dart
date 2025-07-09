import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class BillionStatWidget extends StatelessWidget {
  const BillionStatWidget({
    required this.leadingEmoji,
    required this.statTitle,
    this.action,
    super.key,
    this.statDescription,
    this.subAction,
    this.actionCallBack,
  });

  final String leadingEmoji;
  final String statTitle;
  final String? statDescription;
  final Widget? action;
  final Widget? subAction;
  final Future<void> Function()? actionCallBack;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets listTilePadding = EdgeInsets.symmetric(
      vertical: statDescription == null || statDescription == ''
          ? 11
          : 3,
      horizontal: 16,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: actionCallBack,
          contentPadding: listTilePadding,
          dense: true,
          leading: leadingEmoji.isNotEmpty
              ? CircleAvatar(
                  radius: 12,
                  backgroundColor: BillionColors.primaryContainer,
                  child: Text(leadingEmoji),
                )
              : null,
          title: BillionText.bodyLarge(statTitle),

          subtitle: statDescription != null && statDescription != ''
              ? BillionText.labelMedium(statDescription!)
              : null,

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: action ?? const SizedBox.shrink(),
                  ),
                  subAction != null
                      ? Flexible(
                          child: subAction!,
                        )
                      : const SizedBox.shrink(),
                ],
              ),

              Assets.icons.moreVert.svg(
                colorFilter: ColorFilter.mode(
                  BillionColors.tertiary.withValues(alpha: 0.3),
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: BillionColors.outlineVariant),
      ],
    );
  }
}
