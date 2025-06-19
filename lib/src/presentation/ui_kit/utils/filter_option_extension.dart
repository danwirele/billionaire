import 'package:billionaire/core/enum/filter_option.dart';

extension FilterOptionExtension on FilterOption {
  String get displayName {
    switch (this) {
      case FilterOption.dateAscending:
        return 'Дата по возрастанию';
      case FilterOption.dateDescending:
        return 'Дата по убыванию';
      case FilterOption.priceAscending:
        return 'Цена по возрастанию';
      case FilterOption.priceDescending:
        return 'Цена по убыванию';
    }
  }
}
