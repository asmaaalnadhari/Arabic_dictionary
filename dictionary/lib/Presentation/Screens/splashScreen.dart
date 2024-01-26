import 'package:dictionary/Presentation/Screens/Alphabet.dart';
import 'package:dictionary/Presentation/Screens/game_level.dart';
import 'package:dictionary/Presentation/Shared/component.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
//------------------------------------------------------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay the screen transition for 10 seconds
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GameLevel()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LottieBuilder.asset("assets/Animation/splash1.json"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 10),
                Flexible(
                  flex: 20,
                  child: LottieBuilder.asset("assets/Animation/splash.json"),
                ),

                homePageTitle(title: 'تعلم معنا ..!🤩', isHome: false),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
