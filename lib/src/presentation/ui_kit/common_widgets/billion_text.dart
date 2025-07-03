part of '../ui_kit.dart';

class BillionText extends StatelessWidget {
  BillionText.titleLarge(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.color,
    this.overflow = TextOverflow.ellipsis,
  }) : textStyle = BillionTextStyle.titleLarge.copyWith(color: color);

  BillionText.titleMedium(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.color,
    this.overflow = TextOverflow.ellipsis,
  }) : textStyle = BillionTextStyle.titleMedium.copyWith(
         color: color,
       );

  BillionText.labelMedium(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.color,
    this.overflow = TextOverflow.ellipsis,
  }) : textStyle = BillionTextStyle.labelMedium.copyWith(
         color: color,
       );

  BillionText.bodyLarge(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.color,
    this.overflow = TextOverflow.ellipsis,
  }) : textStyle = BillionTextStyle.bodyLarge.copyWith(color: color);

  BillionText.bodyMedium(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.color,
    this.overflow = TextOverflow.ellipsis,
  }) : textStyle = BillionTextStyle.bodyMedium.copyWith(color: color);

  final TextStyle textStyle;
  final String text;
  final TextOverflow overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;

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
