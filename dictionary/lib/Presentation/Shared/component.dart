import 'package:dictionary/Domain/cubit/apps_cubit.dart';
import 'package:dictionary/Presentation/Screens/WordDetails.dart';
import 'package:flutter/material.dart';
import '../../Core/Theme_light/Theme_light_colors.dart';
import '../../Core/Theme_light/Theme_light_meth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Domain/cubit/apps_cubit.dart';

//-------------------Add Theme Color--------------------
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
//------------------buildAlphabet Method----------------------
BlocConsumer buildAlphabet({required String alphabet,required BuildContext context}) {
  return BlocConsumer<AppsCubit, AppsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return InkWell(
    onTap: (){
      print("InkWell");
      BlocProvider.of<AppsCubit>(context).getAllWords(sendYourAlphabet: alphabet);
        if(state is GetDictionaryLoaded)
          {
            print("\n\n\n\n\n\n\n\n GetDictionaryLoaded : ${state is GetDictionaryLoaded} \n\n\n\n\n\n\n\n ");
          }
        else
        {
          print("\n\n\n\n\ kk n\n\n\n");
        }
         return buildBottomSheet(context, alphabet: alphabet,myWords:state is GetDictionaryLoaded?state.allMyWords:[]);
    },
    child: Padding(
      padding: const EdgeInsets.all(4.0).r,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.yellow,
          border: Border.all(
            width: 3.r,
            color: AppColors.orangeLight,

          ),
          borderRadius: BorderRadius.circular(10).r,
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        alignment: Alignment.center,
        child: Text(
          alphabet,
          style: buildTheme().textTheme.displayLarge!.copyWith(fontSize: 40.sp),
        ),
      ),
    ),
  );
  },
);
}
//------------------buildBottomSheet Method-------------------------------------
dynamic buildBottomSheet(BuildContext context,{required String alphabet,required List<dynamic>myWords}){
           print("\nbuildBottomSheet\n");
     return scaffoldKey.currentState!.showBottomSheet(
        (context){
          return bodyBottomSheet(context: context, alphabet:alphabet,myWords:myWords);
               },
       backgroundColor: Colors.transparent,
       constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height*0.78,
        maxWidth:  MediaQuery.sizeOf(context).width * 0.99,),
  );
}
//------------------bodyBottomSheet Method-------------------------------------
Column bodyBottomSheet({required BuildContext context,required String alphabet,required List<dynamic>myWords}){
  print("\n\n\n bodyBottomSheet Words :$myWords \n\n\n");
    return Column(
    children: [
      InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset('assets/Icon/close.png',height: 60.r,width: 60.r,),
            ),)),
       SizedBox(height: 3.h,),
      Expanded(
        child: Container(
            margin:  EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height/5.2,right: 15.w,left: 15.w),
            padding: EdgeInsets.all(10.r) ,
            decoration:  BoxDecoration(
              color: AppColors.orangeLight.withOpacity(0.9),
                  image: const DecorationImage(
                  opacity: 0.5,
                  fit: BoxFit.fill,
                  image: AssetImage('assets/Image/bg.jpg',)
                  ),
              border: Border.all(
                  width: 3.r,
                  color: AppColors.green
              ),
              borderRadius:  BorderRadius.circular(20.r),
            ),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  buildChoisedAlphabetForm(alphabet: alphabet),
                  SizedBox(height: 10.h,),
                  Expanded(child:GridView.builder(
                      itemCount:myWords.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4/2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder:(buildContext,index){
                        return buildWord(alphabet:myWords[index],context: buildContext);
                      }) )
                ],
              ),
            )
        ),
      ),
    ],
  );


}
//------------------buildChoisedAlphabetForm Method-------------------------------------
Container buildChoisedAlphabetForm({required String alphabet}){
  return Container(
    alignment: Alignment.center,
    height: 100.r,
    width: 95.r,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.r),
      color: AppColors.green,
      border: Border.all(
        width: 5.r,
        color: AppColors.yellow
      ),
      boxShadow:[
        BoxShadow(
          blurRadius: 3.r,
          spreadRadius: 1.r,
          offset: Offset(2.w, 2.h),
          color: AppColors.yellow.withOpacity(0.3),
        ),
        BoxShadow(
          blurRadius: 3.r,
          spreadRadius: 1.r,
          offset: Offset(-2.w, -2.h),
          color: AppColors.yellow.withOpacity(0.4),
        ),
      ]
    ),
    child: Center(
      child: Text(alphabet,style: buildTheme().textTheme.displayLarge!.copyWith(
        color: AppColors.yellow
      ),),
    ),
  );
}
//------------------buildWord Method-------------------------------------
InkWell buildWord({required Map alphabet,required BuildContext context})
{
  print("Map alphabet $alphabet");
  return InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>const WordDetails()));
    },
    child: Padding(
      padding:  EdgeInsets.all(3.0.r),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.yellow,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.r,
              spreadRadius: 1.r,
              offset: Offset(2.w, 2.h),
              color: AppColors.green,
            ),
            BoxShadow(
              blurRadius: 3.r,
              spreadRadius: 1.r,
              offset: Offset(-2.w, -2.h),
              color: AppColors.green,
            ),

          ],
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
        alignment: Alignment.center,
        height: 30.h,
        width: 100.w,
        child: SingleChildScrollView(
          scrollDirection:Axis.horizontal,
          child: Text(
            alphabet['word'],
            textAlign: TextAlign.start,
            style: buildTheme().textTheme.displayMedium,
          ),
        ),
      ),
    ),
  );
}
//------------------buildIconsInfo Method-------------------------------------
Container buildIconsInfo({required Widget icon,required String name}){
  return Container(
    margin:  EdgeInsetsDirectional.only(start: 5.w,end: 2.w),
    padding:EdgeInsets.all(3.r),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 28.r,
          color: AppColors.orange,
            onPressed:(){
            },
            icon: icon),
        Text(name,style: buildTheme().textTheme.displayMedium!.copyWith(
            fontSize: 13.sp,
            color: Colors.black54
        ),)
      ],
    ),
  );
}
//------------------homePageTitle Method-------------------------------------
Padding homePageTitle({required String title,required bool isHome}){

  return Padding(
    padding:   EdgeInsets.only(top: 30.h),
    child: DefaultTextStyle(
      style: buildTheme().textTheme.displayLarge!.copyWith(
        fontSize: isHome?40.sp:50.sp
      ),
      child: AnimatedTextKit(
        isRepeatingAnimation:false,
        animatedTexts: [
          TypewriterAnimatedText(title,
          cursor: '',
           curve: Curves.linear,
            speed: const Duration(milliseconds: 200)
          ),

        ],
      ),
    ),
  );
}
//------------------boardAlphabet Method-------------------------------------
Padding boardAlphabet({required BuildContext context}){
  return   Padding(
    padding:  EdgeInsets.only(top: 20.0.h),
    child: Container(
      height: MediaQuery.sizeOf(context).height*0.75,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.green.withOpacity(0.23)
            )
          ],
          borderRadius: BorderRadius.circular(20.r),
          border:Border.all(
            color: AppColors.green,
            width: 5.r,
          )
      ),
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10).r,
      margin:  EdgeInsets.all(5.r),
      child: GridView.builder(
          itemCount: arabicAlphabets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 3/4,
              crossAxisSpacing: 3),
          itemBuilder:(buildContext,index){
            return buildAlphabet(alphabet: arabicAlphabets[index],context: buildContext,);
          }),
    ),
  );
}
//------------------detailedTitle Method-------------------------------------
Padding detailedTitle(){
  return Padding(
    padding: EdgeInsetsDirectional.only(
        start: 10.w,
        top: 25.h,
        bottom: 20.h
    ),
    child: Text('تعلم أكثر عن كلمة : آبَائِيَّة',style: buildTheme().textTheme.displayLarge!.copyWith(
        fontSize: 25.sp,
        color: AppColors.orange
    ),),
  );
}
//------------------wordInfo Method-------------------------------------
Container wordInfo(){
  return  Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 3.w),

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
              buildIconsInfo(icon: const FaIcon(FontAwesomeIcons.youtube), name: 'فيديو'),
              buildIconsInfo(icon: const FaIcon(FontAwesomeIcons.image), name: 'صورته'),
              buildIconsInfo(icon: const FaIcon(FontAwesomeIcons.info), name: 'مثال'),

            ],
          ),
        ),
       ///center
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          alignment: Alignment.center,
          width: 250.w,
          height: 200.h,
          decoration:  BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              color: AppColors.green,
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  opacity: 0.7,
                  image: AssetImage('assets/Image/board.jpg',)
              )
          ),
          child: Text('الحرف الأول من حروف الهجاء، وهو صوت حنجري، انفجاري، مرقق.',
            style: buildTheme().textTheme.displayMedium!.copyWith(
                color: Colors.black54,
                fontSize: 13.sp
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.yellow.withOpacity(0.6),

                // borderRadius: BorderRadius.circular(10)
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildIconsInfo(icon: FaIcon(FontAwesomeIcons.earthAsia), name: 'عربي'),
                buildIconsInfo(icon: FaIcon(FontAwesomeIcons.earthEurope), name: 'EN'),
                buildIconsInfo(icon: FaIcon(FontAwesomeIcons.volumeHigh), name: 'صوت'),

              ],
            ),
          ),
        )
      ],
    ),
  );
}
//------------------storyDesign Method-------------------------------------
Padding storyDesign(){
  return Padding(
    padding:EdgeInsetsDirectional.only(
        start: 15,
        top: 30
    ),
    child: Text('القصة:',style: buildTheme().textTheme.displayLarge!.copyWith(
        fontSize: 28.sp
    ),),
  );
}
//------------------storyBody Method-------------------------------------
Expanded storyBody(){
  return Expanded(child: SingleChildScrollView(
        child: Container(
  padding: EdgeInsets.symmetric(horizontal: 20.r,vertical: 9.h),
    child:  Text(' لقصة تحكي عن طفلة اسمها ليلى (ذات القبعة الحمراء) طلبت منها أمها أن تأخذ طعاماً إلى بيت جدتها وحذرتها بألا تكلم أحداً في الطريق. إلا أنها في الطريق رأت ذئباً طلب منها أن تلعب معه، ولكنها رفضت وقالت له أنها ذاهبة لبيت جدتها لتعطيها الطعام فاقترح عليها أن تجمع بعض الزهور لتهديها إلى جدتها ففعلت.لقصة تحكي عن طفلة اسمها ليلى (ذات القبعة الحمراء) طلبت منها أمها أن تأخذ طعاماً إلى بيت جدتها وحذرتها بألا تكلم أحداً في الطريق. إلا أنها في الطريق رأت ذئباً طلب منها أن تلعب معه، ولكنها رفضت وقالت له أنها ذاهبة لبيت جدتها لتعطيها الطعام فاقترح عليها أن تجمع بعض الزهور لتهديها إلى جدتها ففعلت.لقصة تحكي عن طفلة اسمها ليلى (ذات القبعة الحمراء) طلبت منها أمها أن تأخذ طعاماً إلى بيت جدتها وحذرتها بألا تكلم أحداً في الطريق. إلا أنها في الطريق رأت ذئباً طلب منها أن تلعب معه، ولكنها رفضت وقالت له أنها ذاهبة لبيت جدتها لتعطيها الطعام فاقترح عليها أن تجمع بعض الزهور لتهديها إلى جدتها ففعلت لقصة تحكي عن طفلة اسمها ليلى (ذات القبعة الحمراء) طلبت منها أمها أن تأخذ طعاماً إلى بيت جدتها وحذرتها بألا تكلم أحداً في الطريق. إلا أنها في الطريق رأت ذئباً طلب منها أن تلعب معه، ولكنها رفضت وقالت له أنها ذاهبة لبيت جدتها لتعطيها الطعام فاقترح عليها أن تجمع بعض الزهور لتهديها إلى جدتها ففعلت..',
    style: TextStyle(
      fontSize: 13.8.sp,color: Colors.black
),
    )
  ),
    ));
}
///Const Variables:
///01:
List<String> arabicAlphabets = [
  'ء','آ', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ', 'د', 'ذ', 'ر', 'ز', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق', 'ك', 'ل', 'م', 'ن', 'ه', 'و', 'ي'
];
///02:
List<String> arabicWord = [
  'آبَائِيّ','آبَائِيّ','آبَائِيَّة','آبَائِيَّة','آبَاط'
];

///03:
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
///04:
String tableName='kids';
///======================================
///DataBase Constant:
