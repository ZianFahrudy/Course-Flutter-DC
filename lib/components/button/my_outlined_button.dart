// ignore_for_file: must_be_immutable

import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    required this.text,
    this.sizeH,
    this.sizeW,
    super.key,
    this.foregroundColor,
    this.backgroundColor,
    this.textcolor,
    this.onPressed,
  });

  final String text;
  final double? sizeH;
  final double? sizeW;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? textcolor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor ?? Palette.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(
          color: Palette.primary,
        ),
        backgroundColor: backgroundColor ?? Colors.white,
        minimumSize: Size(
          sizeW ?? double.infinity,
          sizeH ?? 50,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: MyTypography.bodyLarge
            .copyWith(color: textcolor ?? Palette.primary),
      ),
    );
  }
}
