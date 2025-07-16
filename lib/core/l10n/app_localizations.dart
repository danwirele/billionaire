import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @accountNotFound.
  ///
  /// In en, this message translates to:
  /// **'Account not found'**
  String get accountNotFound;

  /// No description provided for @addition.
  ///
  /// In en, this message translates to:
  /// **'Addition'**
  String get addition;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @appBarAccount.
  ///
  /// In en, this message translates to:
  /// **'My account'**
  String get appBarAccount;

  /// No description provided for @appBarAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get appBarAnalysis;

  /// No description provided for @appBarExpenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses today'**
  String get appBarExpenses;

  /// No description provided for @appBarIncome.
  ///
  /// In en, this message translates to:
  /// **'Income today'**
  String get appBarIncome;

  /// No description provided for @appBarSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get appBarSettings;

  /// No description provided for @appBarStats.
  ///
  /// In en, this message translates to:
  /// **'My stats'**
  String get appBarStats;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @beginning.
  ///
  /// In en, this message translates to:
  /// **'Beginning'**
  String get beginning;

  /// No description provided for @byDay.
  ///
  /// In en, this message translates to:
  /// **' By day'**
  String get byDay;

  /// No description provided for @byMonth.
  ///
  /// In en, this message translates to:
  /// **' By month'**
  String get byMonth;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @choosePrimaryColor.
  ///
  /// In en, this message translates to:
  /// **'Choose a primary color'**
  String get choosePrimaryColor;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get contactSupport;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @deleteTransaction.
  ///
  /// In en, this message translates to:
  /// **'Delete transaction'**
  String get deleteTransaction;

  /// No description provided for @editing.
  ///
  /// In en, this message translates to:
  /// **'Editing'**
  String get editing;

  /// No description provided for @emptyData.
  ///
  /// In en, this message translates to:
  /// **'No data to display'**
  String get emptyData;

  /// No description provided for @ending.
  ///
  /// In en, this message translates to:
  /// **'Ending'**
  String get ending;

  /// No description provided for @enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get enterAmount;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @errorAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get errorAccount;

  /// No description provided for @errorAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get errorAmount;

  /// No description provided for @errorCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get errorCategory;

  /// No description provided for @errorGettingCategories.
  ///
  /// In en, this message translates to:
  /// **'Error getting categories'**
  String get errorGettingCategories;

  /// No description provided for @filterDateAscending.
  ///
  /// In en, this message translates to:
  /// **'Date ascending'**
  String get filterDateAscending;

  /// No description provided for @filterDateDescending.
  ///
  /// In en, this message translates to:
  /// **'Date descending'**
  String get filterDateDescending;

  /// No description provided for @filterPriceAscending.
  ///
  /// In en, this message translates to:
  /// **'Price ascending'**
  String get filterPriceAscending;

  /// No description provided for @filterPriceDescending.
  ///
  /// In en, this message translates to:
  /// **'Price descending'**
  String get filterPriceDescending;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @findCategory.
  ///
  /// In en, this message translates to:
  /// **'Find category'**
  String get findCategory;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @myHistory.
  ///
  /// In en, this message translates to:
  /// **'My history'**
  String get myHistory;

  /// No description provided for @navBarAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get navBarAccount;

  /// No description provided for @navBarExpenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get navBarExpenses;

  /// No description provided for @navBarIncome.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get navBarIncome;

  /// No description provided for @navBarSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navBarSettings;

  /// No description provided for @navBarStats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get navBarStats;

  /// No description provided for @newAccountName.
  ///
  /// In en, this message translates to:
  /// **'New account name'**
  String get newAccountName;

  /// No description provided for @newTransactionComment.
  ///
  /// In en, this message translates to:
  /// **'New transaction comment'**
  String get newTransactionComment;

  /// No description provided for @noCategories.
  ///
  /// In en, this message translates to:
  /// **'No categories'**
  String get noCategories;

  /// No description provided for @noDataToDisplay.
  ///
  /// In en, this message translates to:
  /// **'There is no data to display'**
  String get noDataToDisplay;

  /// No description provided for @noInformation.
  ///
  /// In en, this message translates to:
  /// **'No information'**
  String get noInformation;

  /// No description provided for @noTransactions.
  ///
  /// In en, this message translates to:
  /// **'No transactions'**
  String get noTransactions;

  /// No description provided for @notSelected.
  ///
  /// In en, this message translates to:
  /// **'Not selected'**
  String get notSelected;

  /// No description provided for @notSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get notSpecified;

  /// No description provided for @periodBeginning.
  ///
  /// In en, this message translates to:
  /// **'Period: beginning'**
  String get periodBeginning;

  /// No description provided for @periodEnd.
  ///
  /// In en, this message translates to:
  /// **'Period: end'**
  String get periodEnd;

  /// No description provided for @pleaseFillFollowingFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in the following fields'**
  String get pleaseFillFollowingFields;

  /// No description provided for @primaryColor.
  ///
  /// In en, this message translates to:
  /// **'Primary color'**
  String get primaryColor;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @selectFilter.
  ///
  /// In en, this message translates to:
  /// **'Select filter'**
  String get selectFilter;

  /// No description provided for @sorryErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Sorry, an error occurred'**
  String get sorryErrorOccurred;

  /// No description provided for @sorryErrorOccurredNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Sorry, an error occurred, account not found'**
  String get sorryErrorOccurredNoAccount;

  /// No description provided for @sorting.
  ///
  /// In en, this message translates to:
  /// **'Sorting'**
  String get sorting;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @transactionAmount.
  ///
  /// In en, this message translates to:
  /// **'Transaction amount'**
  String get transactionAmount;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
