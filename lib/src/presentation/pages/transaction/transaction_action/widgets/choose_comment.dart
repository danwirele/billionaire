import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/dialogs_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';

class ChooseComment extends StatelessWidget {
  const ChooseComment({
    required this.commentNotifier,
    super.key,
  });

  final ValueNotifier<String?> commentNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: commentNotifier,
      builder: (context, comment, _) {
        return BillionPinnedContainer.transparentLarge(
          onTap: () async {
            final newComment = await context.showSetTransactionCommentDialog(
              initialComment: comment,
            );
            if (newComment != null) {
              commentNotifier.value = newComment;
            }
          },
          action: const SizedBox.shrink(),
          leading: Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: context.localization.comment,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
              ),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
              ),
              controller: TextEditingController(text: comment),
              enabled: false,
            ),
          ),
        );
      },
    );
  }
}
