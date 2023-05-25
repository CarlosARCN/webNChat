import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newwhatsup/common/styles/colors.dart';
import 'package:newwhatsup/common/styles/dimensions.dart';

import 'typography.dart';

final theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: ColorStyles.primary,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: ColorStyles.baseBody,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    iconTheme: const IconThemeData(
      size: Dimensions.x24,
    ),
    surfaceTintColor: ColorStyles.activeField,
    titleTextStyle: TextStyles.textLarge.copyWith(
      color: ColorStyles.textPrimary,
      fontSize: Dimensions.x18,
    ),
    foregroundColor: ColorStyles.activeIcon,
    backgroundColor: ColorStyles.baseBody,
    toolbarTextStyle: TextStyles.textMedium,
    elevation: Dimensions.tiny,
    toolbarHeight: Dimensions.x56,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(
          Dimensions.x20,
        ),
      ),
    ),
  ),
  fontFamily: 'Teko',
  textTheme: TextTheme(
    displayLarge: TextStyles.displayHuge,
    displayMedium: TextStyles.displaySuperLarge,
    displaySmall: TextStyles.displayLarge,
    headlineMedium: TextStyles.displayMedium,
    headlineSmall: TextStyles.displaySmall,
    titleLarge: TextStyles.displayTiny,
    bodyLarge: TextStyles.textTiny,
    bodyMedium: TextStyles.textMedium,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: ColorStyles.baseBody),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: ColorStyles.primary)
      .copyWith(background: ColorStyles.baseBackground)
      .copyWith(error: ColorStyles.alertRed),
);
