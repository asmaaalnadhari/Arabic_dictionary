import 'package:flutter/material.dart';
import 'Theme_light_colors.dart';
import 'package:dictionary/Presentation/Shared/component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData buildTheme()=>ThemeData(
  primarySwatch: buildMaterialColor(AppColors.orange),
  textTheme:  TextTheme(

    displayLarge: TextStyle(
    color: AppColors.orange,
        fontFamily: 'Blabeloo',
        fontSize: 50.sp,
      fontWeight: FontWeight.bold
    ),
      displayMedium: TextStyle(
          color: AppColors.green,
          fontFamily: 'Bahij',
          fontSize: 23.sp,
      )

  )

);