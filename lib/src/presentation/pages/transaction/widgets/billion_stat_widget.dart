import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BillionStatWidget extends StatelessWidget {
  const BillionStatWidget({
    super.key,
    required this.leadingEmoji,
    required this.statTitle,
    this.statDescription,
    required this.transactionAmount,
    this.transactionTime,
    this.actionCallBack,
    required this.currency,
  });

  final String leadingEmoji;
  final String statTitle;
  final String? statDescription;
  final String transactionAmount;
  final DateTime? transactionTime;
  final String currency;
  final Future<void> Function()? actionCallBack;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets listTilePadding = EdgeInsets.symmetric(
      vertical: statDescription == null ? 11 : 3,
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
                  backgroundColor: BillionColors.onPrimary,
                  child: Text(leadingEmoji),
                )
              : null,
          title: BillionText.bodyLarge(statTitle),

          subtitle: statDescription != null
              ? BillionText.bodyMedium(statDescription!)
              : null,

          trailing: Row(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BillionText.bodyLarge(
                    '$transactionAmount $currency',
                  ),
                  transactionTime != null
                      ? BillionText.bodyLarge(
                          transactionTime!.toHHmm(),
                        )
                      : SizedBox.shrink(),
                ],
              ),

              GestureDetector(
                onTap: actionCallBack,
                child: SvgPicture.asset(
                  Assets.icons.moreVert.path,
                  colorFilter: ColorFilter.mode(
                    BillionColors.tertiary.withValues(alpha: 0.3),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: BillionColors.outlineVariant),
      ],
    );
  }
}
