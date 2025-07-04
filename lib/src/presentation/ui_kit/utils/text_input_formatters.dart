import 'package:flutter/services.dart';


  
class LocalizedDecimalAndThousandInputFormatter extends TextInputFormatter {
  LocalizedDecimalAndThousandInputFormatter({
    required this.validDecimalSeparator,
    this.maxDigitsAfterDecimal = 2,
  }) {
    // Неверный разделитель — это противоположный символ
    invalidDecimalSeparator = validDecimalSeparator == ',' ? '.' : ',';
  }
  final int maxDigitsAfterDecimal;

  final String validDecimalSeparator;
  late final String invalidDecimalSeparator;
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    // Сохраняем позицию курсора
    int selectionIndex = newValue.selection.end;

    // Если есть неверный разделитель — заменяем
    if (text.contains(invalidDecimalSeparator)) {
      text = text.replaceAll(invalidDecimalSeparator, validDecimalSeparator);
    }

    // Убираем все лишние символы, кроме цифр и правильного разделителя
    final parts = text.split(validDecimalSeparator);
    String mainPart = parts[0].replaceAll(RegExp(r'[^\d]'), '');
    String? decimalPart = parts.length > 1 ? parts[1] : null;

    // Ограничиваем дробную часть
    if (decimalPart != null && decimalPart.length > maxDigitsAfterDecimal) {
      decimalPart = decimalPart.substring(0, maxDigitsAfterDecimal);
    }

    // Форматируем целую часть с пробелами
    String formattedMainPart = _formatThousands(mainPart);

    // Собираем финальный текст
    String formattedText = decimalPart != null ? '$formattedMainPart$validDecimalSeparator$decimalPart' : formattedMainPart;

    // Обновляем позицию курсора с учётом добавленных пробелов
    final difference = formattedText.length - text.length;
    selectionIndex += difference;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }

  // Метод для форматирования тысяч с пробелами
  String _formatThousands(String numberStr) {
    if (numberStr.isEmpty) return '';

    List<String> characters = numberStr.split('').reversed.toList();
    List<String> result = [];

    for (int i = 0; i < characters.length; i++) {
      if (i != 0 && i % 3 == 0) {
        result.add(' ');
      }
      result.add(characters[i]);
    }

    return result.reversed.join();
  }

 
}
