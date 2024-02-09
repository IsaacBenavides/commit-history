import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.onTap,
    this.splashColor,
    this.borderRadius,
    this.elevation,
    this.paddingButtonHorizontal,
    this.paddingButtonVertical,
  });

  final Widget child;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;
  final Color? splashColor;
  final BorderRadius? borderRadius;
  final double? elevation;
  final double? paddingButtonHorizontal;
  final double? paddingButtonVertical;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(elevation ?? 1.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.sp),
            side: BorderSide(color: borderColor ?? color ?? Colors.grey),
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          splashColor ?? const Color.fromARGB(255, 75, 80, 82),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? Colors.grey,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (paddingButtonHorizontal ?? 0).sp,
          vertical: (paddingButtonVertical ?? 0).sp,
        ),
        child: child,
      ),
    );
  }
}

class BigButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double? width, height;
  final bool useButtonBorder;

  const BigButton({
    super.key,
    this.onTap,
    required this.text,
    this.width,
    this.height,
    this.useButtonBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 366.sp,
      height: height ?? 60.sp,
      child: CustomButtom(
        borderColor: useButtonBorder ? Colors.grey : null,
        color: useButtonBorder ? Colors.white : null,
        onTap: onTap,
        splashColor: useButtonBorder ? Colors.grey.withOpacity(.1) : null,
        child: CustomText(
          text: text,
          color: useButtonBorder ? Colors.black54 : Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
