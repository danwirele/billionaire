import 'package:billionaire/src/presentation/pages/stats/controllers/stats_controller.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/error_helper.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return BillionScaffold(
      appBar: BillionAppBar(
        title: context.localization.appBarStats,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return ref
              .watch(statsControllerProvider)
              .when(
                skipLoadingOnRefresh: true,
                skipLoadingOnReload: true,
                data: (categories) {
                  debugPrint(categories.toString());
                  return Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: colorScheme.surfaceContainerHigh,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 14,
                          ),
                          hintText: context.localization.findCategory,

                          suffixIcon: Icon(
                            Icons.search,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (query) async {
                          await ref.read(statsControllerProvider.notifier).fuzzySearchLevenshtein(query);
                        },
                      ),
                      const BillionDivider(),
                      Expanded(
                        child: categories.isEmpty
                            ? Center(
                                child: BillionText.bodyMedium(
                                  context.localization.noCategories,
                                ),
                              )
                            : ListView.builder(
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  final category = categories[index];

                                  return Column(
                                    children: [
                                      ListTile(
                                        dense: true,
                                        contentPadding: const EdgeInsets.symmetric(
                                          vertical: 11,
                                          horizontal: 16,
                                        ),
                                        leading: category.emoji.isNotEmpty
                                            ? CircleAvatar(
                                                radius: 12,
                                                backgroundColor: colorScheme.primaryContainer,
                                                child: Text(
                                                  category.emoji,
                                                ),
                                              )
                                            : const SizedBox.shrink(),

                                        title: BillionText.bodyLarge(
                                          category.name,
                                        ),
                                      ),
                                      const Divider(height: 1),
                                    ],
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) {
                  final errorMessage = context.whenError(
                    error,
                    context.localization.errorGettingCategories,
                  );

                  return Center(
                    child: BillionText.bodyMedium(
                      errorMessage,
                    ),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
        },
      ),
    );
  }
}
