import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/presentation/pages/stats/controllers/stats_controller.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/error_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BillionScaffold(
      appBar: BillionAppBar(
        title: AppLocalizations.of(context)!.appBarStats,
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
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffECE6F0),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 14,
                          ),
                          //TODO! CHECK WHAT WENT WRONG WHY 2 GIFTS
                          hintText: 'Найти статью',

                          suffixIcon: Icon(
                            Icons.search,
                            color: Color(0xff1D1B20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (query) async {
                          await ref
                              .read(statsControllerProvider.notifier)
                              .fuzzySearchLevenshtein(query);
                        },
                      ),
                      Expanded(
                        child: categories.isEmpty
                            ? Center(
                                child: BillionText.bodyMedium(
                                  'Категории отсутствуют',
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
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 11,
                                              horizontal: 16,
                                            ),
                                        leading:
                                            category.emoji.isNotEmpty
                                            ? CircleAvatar(
                                                radius: 12,
                                                backgroundColor:
                                                    BillionColors
                                                        .primaryContainer,
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
                  final errorMessage = ErrorHelper.whenError(
                    error,
                    'Произошла ошибка получения категорий',
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
