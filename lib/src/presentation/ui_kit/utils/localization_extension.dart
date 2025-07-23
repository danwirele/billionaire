import 'package:billionaire/core/l10n/app_localizations.dart' show AppLocalizations;
import 'package:flutter/widgets.dart' show BuildContext;

extension LocalizationExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this);
}
