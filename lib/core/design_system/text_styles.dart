library;

import 'package:flutter/material.dart';

///Design system make a modular design system for the app. Can will be easily mantein a well structure UI
///Make it with constructs class, make it more scalable and readable for developers.
///And can reply the implements with icons, colors and images

final class DesignSystem {
  ///make static the class to avoid instances
  static final textStyles = _TextStyles();

  const DesignSystem._();
}

///immutable annotation to make the class immutable for the compiler
@immutable
final class _TextStyles {
  final headings = const _Headings._();
  final body = const _Body._();

  const _TextStyles();
}

@immutable
final class _Headings {
  const _Headings._();

  TextStyle h1({Color? color, bool useHeight = true}) => TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      fontSize: 32,
      height: useHeight ? 1.5 : 1.0,
      color: color ?? Colors.black);

  TextStyle h2({Color? color, bool useHeight = true}) => TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: useHeight ? 1.5 : 1.0,
      color: color ?? Colors.black);

  TextStyle h3({Color? color, bool useHeight = true}) => TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: useHeight ? 1.5 : 1.0,
      color: color ?? Colors.black);
}

@immutable
final class _Body {
  const _Body._();


  TextStyle semibold({Color? color, bool useHeight = true}) => TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: useHeight ? 1.5 : 1.0,
      color: color ?? const Color(0xFF222222));

  TextStyle crossedOutSemibold({Color? color, bool useHeight = true}) => TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      decoration: TextDecoration.lineThrough,
      height: useHeight ? 1.5 : 1.0,
      color: color ?? const Color(0xFF222222));

  TextStyle regular({Color? color, bool useHeight = true}) => TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: useHeight ? 1.5 : 1.0,
      color: color ?? const Color(0xFF222222));
}