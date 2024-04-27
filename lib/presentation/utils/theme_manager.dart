import 'package:flutter/material.dart';
import 'package:ibm_task/presentation/utils/styles_manager.dart';
import 'package:ibm_task/presentation/utils/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.primary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    // ripple effect color
    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: bodyText2,
    ),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.darkGrey,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: buttonText1.copyWith(color: ColorManager.white),
            foregroundColor: ColorManager.white.withOpacity(AppSize.s0_4))),
    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: ColorManager.white.withOpacity(AppSize.s0_4),
            textStyle: buttonText1.copyWith(color: ColorManager.white),
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(

        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: bodyText3.copyWith(color: ColorManager.darkBlue),
        labelStyle: bodyText2.copyWith(color: ColorManager.darkBlue),
        errorStyle: bodyText2.copyWith(color: ColorManager.error),

        // enabled border style
        enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        disabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.lightGrey, width: AppSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // error border style
        errorBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
