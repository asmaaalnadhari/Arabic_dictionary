import 'package:dictionary/Domain/cubit/apps_cubit.dart';
import 'package:dictionary/Presentation/Screens/WordDetails.dart';
import 'package:flutter/material.dart';
import '../../Core/Theme_light/Theme_light_colors.dart';
import '../../Core/Theme_light/Theme_light_meth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
      // print("InkWell");
      // BlocProvider.of<AppsCubit>(context).getAllWords(sendYourAlphabet: alphabet);
      //   if(state is GetDictionaryLoaded)
      //     {
      //       print("\n\n\n\n\n\n\n\n GetDictionaryLoaded : ${state is GetDictionaryLoaded} \n\n\n\n\n\n\n\n ");
      //     }
      //   else
      //   {
      //     print("\n\n\n\n\ kk n\n\n\n");
      //   }
      //    return buildBottomSheet(context, alphabet: alphabet,myWords:state is GetDictionaryLoaded?state.allMyWords:[]);
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
dynamic buildBottomSheet(BuildContext context,{required int i}){
           print("\nbuildBottomSheet\n");
     return scaffoldKey.currentState!.showBottomSheet(
        (context){
          return bodyBottomSheet(context: context, i:i,);
               },
       backgroundColor: Colors.white.withOpacity(0.7),
       constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height*1.3,
        maxWidth:  MediaQuery.sizeOf(context).width * 0.99,),
  );
}
//------------------bodyBottomSheet Method-------------------------------------
Column bodyBottomSheet({required BuildContext context,required int i}){
  print("\n\n\n bodyBottomSheet Words :$i ");
    return Column(
    children: [
      InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:  EdgeInsets.only(right: 8.0.w,top: 40.h),
              child: Image.asset('assets/Icon/close.png',height: 60.r,width: 60.r,),
            ),)),
       SizedBox(height: 3.h,),
      Expanded(
        child: Container(
            margin:  EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height/9.9,right: 15.w,left: 15.w),
            padding: EdgeInsets.all(10.r) ,
            decoration:  BoxDecoration(
              color: Colors.white,
                  // image: const DecorationImage(
                  // opacity: 0.2,
                  // fit: BoxFit.fill,
                  // // image: AssetImage('assets/Image/bg.jpg',)
                  // ),
              border: Border.all(
                  width: 3.r,
                  color: AppColors.orange
              ),
              borderRadius:  BorderRadius.circular(20.r),
            ),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  buildChoisedAlphabetForm(index: i),
                  SizedBox(height: 10.h,),
                  Expanded(child:GridView.builder(
                      itemCount:10,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:i==2?4/1.7: 3/2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder:(buildContext,index){
                        print('index: $index');
                        return buildWord(alphabet:i==0?ethicsTopics[index]:i==1?prophetNames[index]:quranicAnimals[index],context: buildContext);
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
Container buildChoisedAlphabetForm({required int index}){
  return Container(
    alignment: Alignment.center,
    height: 100.h,
    width: index==2?double.maxFinite.w:index==0?200:300,
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(30.r),
    //     color: Colors.white.withOpacity(0.2),
    //   border: Border.all(
    //     width: 5.r,
    //     color: AppColors.green
    //   ),
    //   // boxShadow:[
    //   //   BoxShadow(
    //   //     blurRadius: 3.r,
    //   //     spreadRadius: 1.r,
    //   //     offset: Offset(2.w, 2.h),
    //   //     color: AppColors.yellow.withOpacity(0.3),
    //   //   ),
    //   //   BoxShadow(
    //   //     blurRadius: 3.r,
    //   //     spreadRadius: 1.r,
    //   //     offset: Offset(-2.w, -2.h),
    //   //     color: AppColors.yellow.withOpacity(0.4),
    //   //   ),
    //   // ]
    // ),
    child:   Column(
      children: [
        const Icon(Icons.star,size: 30,color: Colors.red,),
        SizedBox(height: 10.h,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:         Text(index==0?'الأخلاق':index==1?"حياة الأنبياء":"حيوانات ذكرت في القران",style: buildTheme().textTheme.displayLarge!.copyWith(
              color: AppColors.orange,
              fontSize: 35.sp
          ),),

        )
      ],
    )
  );
}
//------------------buildWord Method-------------------------------------
InkWell buildWord({required String alphabet,required BuildContext context})
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
          color: AppColors.yellow.withOpacity(0.7),
          // border: Border.all(
          //   width: 3,
          //   color: AppColors.orange
          // ),
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 3.r,
          //     spreadRadius: 1.r,
          //     offset: Offset(2.w, 2.h),
          //     color: AppColors.orange,
          //   ),
          //   BoxShadow(
          //     blurRadius: 3.r,
          //     spreadRadius: 1.r,
          //     offset: Offset(-2.w, -2.h),
          //     color: AppColors.orange,
          //   ),
          //
          // ],
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
        width: 100.w,
        child: SingleChildScrollView(
          child: Text(
            alphabet,
            textAlign: TextAlign.center,
            style: buildTheme().textTheme.displayMedium,
          ),
        ),
      ),
    ),
  );
}
//------------------buildIconsInfo Method-------------------------------------
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
    child: Text('تعلم من القرآن عن: الأمانة',style: buildTheme().textTheme.displayLarge!.copyWith(
        fontSize: 25.sp,
        color: AppColors.orange
    ),),
  );
}
//------------------wordInfo Method-------------------------------------
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
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
              color: AppColors.green.withOpacity(0.4),

              borderRadius: BorderRadius.circular(20)
          ),
  padding: EdgeInsets.symmetric(horizontal: 20.r,vertical: 9.h),
    child:  Text("""بعث النبيّ -عليه الصلاة والسلام- بالأمانة في بعثته، وكانت ثقةً بين قومه، حيث وضعوا الأمانات عنده. في أحداث هامة، عندما كان يستعد للهجرة إلى المدينة المنوّرة، كان يحمل أماناتٍ لقريش، وفي تلك اللحظة طلب من علي بن أبي طالب -رضي الله عنه- أن يعيد الأمانات إلى أهلها.

تبرز أمانة النبيّ -عليه الصلاة والسلام- في الأحداث، حيث قام بإعادة مفتاح الكعبة لعثمان بن طلحة بعد أن استلمه يوم فتح مكّة المكرّمة. ومن دلائل شدة أمانته، تجلى ذلك في امتناعه عن تناول التمر الذي وجده في بيته أو على فراشه، خوفًا من أن يكون من التمور المعدّة للصدقة، التي كانت محرّمةً على النبيّ وأهله، حيث كانت حقًّا للفقراء والمحتاجين.""",
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300
    ),)
  ),
    ));
}
///Const Variables:
///01:
List<String> arabicAlphabets = [
  'ء','آ', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ', 'د', 'ذ', 'ر', 'ز', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق', 'ك', 'ل', 'م', 'ن', 'ه', 'و', 'ي'
];
///02:
List<String> ethicsTopics = [
  'الإلتزام بالأمانة',
  'العدالة والمساواة',
  'الرحمة والتسامح',
  'الصبر والاحتساب',
  'حقوق الآخرين',
  'الصداقة والوفاء',
  'الاعتدال والتوازن',
  'التواضع والاستقامة',
  'العفاف والحياء',
  'العمل الصالح والخير العام',
];
///03:
List<String> prophetNames = [
  'آدم عليه السلام',
  'نوح عليه السلام',
  'إبراهيم عليه السلام',
  'موسى عليه السلام',
  'عيسى عليه السلام',
  'داود عليه السلام',
  'سليمان عليه السلام',
  'إسماعيل عليه السلام',
  'يونس عليه السلام',
  'محمد صلى الله عليه وسلم',
];

///04:
List<String> quranicAnimals = [
  'الإبل',
  'البقر',
  'الغنم',
  'الخيل',
  'الفيل',
  'الذئب',
  'السمك',
  'النمل',
  'البحرين (البحر والأنهار)',
  'الطير (العصافير والحمام)',
];

///05:
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
///06:
String tableName='kids';
///======================================
///DataBase Constant:
