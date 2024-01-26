import 'package:dictionary/Presentation/Screens/Alphabet.dart';
import 'package:dictionary/Presentation/Screens/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Core/Theme_light/Theme_light_meth.dart';
import 'package:dictionary/Presentation/Shared/shared_preferences/shared_prefrences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Presentation/Screens/game_level.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
    designSize: const Size(360, 690),
    splitScreenMode: true,
    minTextAdapt: true,
    builder: (BuildContext context, Widget? child)
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: buildTheme(),
        localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        supportedLocales: const [
            Locale("ar"), // OR Locale('ar', 'AE') OR Other RTL locales
          ],
        locale: const Locale('ar'),
        home:child ,

    );

    },child:CacheData.getData(key: 'key')??true? const SplashScreen():const GameLevel() ,
      );
  }
}
