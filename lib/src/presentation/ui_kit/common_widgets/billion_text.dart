part of '../ui_kit.dart';

class BillionText extends StatelessWidget {
  const BillionText.titleLarge(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
    this.textStyle = BillionTextStyle.titleLarge,
  });

  const BillionText.titleMedium(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
    this.textStyle = BillionTextStyle.titleMedium,
  });

  const BillionText.labelMedium(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
    this.textStyle = BillionTextStyle.labelMedium,
  });

  const BillionText.bodyLarge(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
    this.textStyle = BillionTextStyle.bodyLarge,
  });

  const BillionText.bodyMedium(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
    this.textStyle = BillionTextStyle.bodyMedium,
  });

  final TextStyle textStyle;
  final String text;
  final TextOverflow overflow;
  final int? maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
