import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Core/Theme_light/Theme_light_colors.dart';
import '../../Core/Theme_light/Theme_light_meth.dart';

class WordInfo extends StatefulWidget {
  @override
  _WordInfoState createState() => _WordInfoState();
}

class _WordInfoState extends State<WordInfo> {
  IconData? selectedIcon;
  String exampleText = '';
  TextAlign textAlignment = TextAlign.right; // Default alignment is right (Arabic)

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 3.w),
      child: Row(
        children: [
          ///right
          Container(
            decoration: BoxDecoration(
              color: AppColors.yellow.withOpacity(0.6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildIconsInfo(
                  icon: const FaIcon(FontAwesomeIcons.youtube),
                  name: 'فيديو',
                  isSelected: selectedIcon == FontAwesomeIcons.youtube,
                  onTap: () {
                    onIconTap(FontAwesomeIcons.youtube);
                  },
                ),
                buildIconsInfo(
                  icon: const FaIcon(FontAwesomeIcons.image),
                  name: 'صورته',
                  isSelected: selectedIcon == FontAwesomeIcons.image,
                  onTap: () {
                    onIconTap(FontAwesomeIcons.image);
                  },
                ),
                buildIconsInfo(
                  icon: const FaIcon(FontAwesomeIcons.info),
                  name: 'مثال',
                  isSelected: selectedIcon == FontAwesomeIcons.info,
                  onTap: () {
                    onIconTap(FontAwesomeIcons.info);
                  },
                ),
              ],
            ),
          ),
          ///center
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            alignment: Alignment.center,
            width: 250.w,
            height: 220.h,
            decoration: BoxDecoration(
              color: AppColors.green,
              image: const DecorationImage(
                fit: BoxFit.fill,
                opacity: 0.7,
                image: AssetImage('assets/Image/board.jpg'),
              ),
            ),
            child: Text(
              exampleText.isNotEmpty ? exampleText : 'نساعدك علئ التعلم\n،بوسائل مختلفة🤩',
              textAlign: textAlignment, // Use dynamic alignment
              style: buildTheme().textTheme.displayMedium!.copyWith(
                color: Colors.black54,
                fontSize: exampleText.isNotEmpty ? 13.sp : 20.sp,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.yellow.withOpacity(0.6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildIconsInfo(
                    icon: FaIcon(FontAwesomeIcons.earthAsia),
                    name: 'عربي',
                    isSelected: selectedIcon == FontAwesomeIcons.earthAsia,
                    onTap: () {
                      onIconTap(FontAwesomeIcons.earthAsia);
                    },
                  ),
                  buildIconsInfo(
                    icon: FaIcon(FontAwesomeIcons.earthEurope),
                    name: 'EN',
                    isSelected: selectedIcon == FontAwesomeIcons.earthEurope,
                    onTap: () {
                      onIconTap(FontAwesomeIcons.earthEurope);
                    },
                  ),
                  buildIconsInfo(
                    icon: FaIcon(FontAwesomeIcons.volumeHigh),
                    name: 'صوت',
                    isSelected: selectedIcon == FontAwesomeIcons.volumeHigh,
                    onTap: () {
                      onIconTap(FontAwesomeIcons.volumeHigh);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildIconsInfo({
    required Widget icon,
    required String name,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 5.w, end: 2.w),
      padding: EdgeInsets.all(3.r),
      child: Column(
        children: [
          IconButton(
            iconSize: 28.r,
            color: isSelected ? Colors.white : AppColors.orange,
            onPressed: onTap,
            icon: icon,
          ),
          Text(
            name,
            style: buildTheme().textTheme.displayMedium!.copyWith(
              fontSize: 13.sp,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }

  // Function to handle icon tap
  void onIconTap(IconData icon) {
    setState(() {
      switch (icon) {
        case FontAwesomeIcons.earthAsia:
        // Example text in Arabic
          exampleText =
          ' الالتزام بالصدق والنزاهة في القول والعمل، وعدم خيانة الثقة الموكولة';
          textAlignment = TextAlign.right; // Right alignment for Arabic
          break;
        case FontAwesomeIcons.earthEurope:
        // Example text in English
          exampleText =
          'Adherence to moral and ethical principles, soundness of moral character honesty';
          textAlignment = TextAlign.center; // Left alignment for English
          break;
        case FontAwesomeIcons.info:
        // Example text in Arabic
          exampleText =
          ' عندما يقول الشخص الحقيقة ويحتفظ بكلمته ويتحلى بالأمانة، يُعتبر مثالًا على الصدق والنزاهة في التصرفات اليومية';
          textAlignment = TextAlign.center; // Right alignment for Arabic
          break;
        default:
        // Reset example text for other icons
          exampleText = '';
          textAlignment = TextAlign.right; // Reset to default alignment
      }
      selectedIcon = icon;
    });
  }
}
