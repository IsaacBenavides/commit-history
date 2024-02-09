import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.isUnderline = false,
    this.textAlign,
    this.letterSpacing,
    this.maxLines,
    this.textOverflow,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isUnderline;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: true,
      style: GoogleFonts.poppins(
        letterSpacing: letterSpacing,
        color: color ?? Colors.white,
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }
}

class CustomTextSpan extends TextSpan {
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isUnderline;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? textOverflow;
  CustomTextSpan({
    super.text,
    super.children,
    super.recognizer,
    MouseCursor? mouseCursor,
    super.onEnter,
    super.onExit,
    super.semanticsLabel,
    super.locale,
    super.spellOut,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.isUnderline = false,
    this.textAlign,
    this.letterSpacing,
    this.maxLines,
    this.textOverflow,
  }) : super(
          style: GoogleFonts.poppins(
            letterSpacing: letterSpacing,
            color: color ?? Colors.white,
            fontSize: fontSize ?? 14.sp,
            fontWeight: fontWeight,
            decoration: isUnderline ? TextDecoration.underline : null,
          ),
        );
}
