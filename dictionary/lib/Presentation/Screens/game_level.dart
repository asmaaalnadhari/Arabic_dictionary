import 'package:dictionary/Core/Theme_light/Theme_light_colors.dart';
import 'package:dictionary/Data/game_level_model.dart';
import 'package:dictionary/Presentation/Shared/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Core/Theme_light/Theme_light_meth.dart';
import '../../Core/widget/text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Shared/shared_preferences/shared_prefrences.dart';

class GameLevel extends StatelessWidget {
  const GameLevel({super.key});

  @override
  Widget build(BuildContext context) {
    CacheData.setData(key: 'key', value: false);

    return Scaffold(
        key: scaffoldKey,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('assets/Image/bg_game_level.jpg'),
                  opacity: 0.1,
                  fit: BoxFit.fill)),
          child: ListView.separated(
            itemCount: myLevels.length,
            itemBuilder: (cx, i) => boxLevel(
                nameLevel: myLevels[i].nameLevel,
                numLevel: myLevels[i].numLevel,
                imgLevel: myLevels[i].imgLevel,
                i: i,
                context: context),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 10,
            ),
          ),
        ));
  }
}

Widget boxLevel(
    {required String nameLevel,
    required String numLevel,
    required String imgLevel,
    required BuildContext context,
    required int i}) {
  return GestureDetector(
    onTap: () {
      return buildBottomSheet(context, i: i);
    },
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 360.h,
          child: Container(
            margin:  EdgeInsets.only(top: 20.h),
            height: 340.h,
            width: 250.w,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/Image/level_bg.jpg',
                  ),
                  opacity: 0.2,
                  fit: BoxFit.cover,
                ),
                border: Border.all(width: 6.w, color: AppColors.green),
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              children: [
                SizedBox(
                  height: i == 0 ? 20.h : 30.h,
                ),
                Image.asset(
                  imgLevel,
                  width: i == 0 ? 150 : 170.w,
                  height: 210.w,
                ),
                SizedBox(
                  height: i == 0 ? 11.h : 0.h,
                ),
                AppTextButton(
                  buttonText: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      nameLevel,
                      style: buildTheme()
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                  horizontalPadding: 20.w,
                  verticalPadding: 10.h,
                  buttonWidth: 210.w,
                  buttonHeight: 50.h,
                  backgroundColor: AppColors.orange,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  onPressed: () {
                    return buildBottomSheet(context, i: i);
                  },
                  i: 1,
                  borderColor: AppColors.orange,
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 160,
          child: AppTextButton(
            horizontalPadding: 20.w,
            verticalPadding: 10.h,
            buttonWidth: 190.w,
            buttonHeight: 50.h,
            borderRadius: 16.r,
            backgroundColor: AppColors.green,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            onPressed: () {},
            buttonText: Text(
              numLevel,
              style: buildTheme().textTheme.displayMedium!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            borderColor: Colors.green,
          ),
        )
      ],
    ),
  );
}
