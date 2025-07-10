import 'dart:async';

import 'package:billionaire/core/enum/currency_enum.dart';
import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/domain/controllers/connection.dart';
import 'package:billionaire/src/presentation/shared/controllers/currency_provider.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

//widgets
part 'common_widgets/billion_app_bar.dart';
part 'common_widgets/billion_bottom_nav_bar.dart';
part 'common_widgets/billion_pinned_container.dart';
part 'common_widgets/billion_divider.dart';
part 'common_widgets/billion_fab.dart';
part 'common_widgets/billion_nav_destination.dart';
part 'common_widgets/billion_scaffold.dart';
part 'common_widgets/billion_text.dart';
part 'common_widgets/nav_bar_wrapper.dart';
part 'common_widgets/billion_arrow_right.dart';

//theme
part 'theme/billion_colors.dart';
part 'theme/billion_text_style.dart';

//utils
part 'utils/date_time_extension.dart';
part 'utils/double_extension.dart';
part 'utils/ref_extension.dart';
