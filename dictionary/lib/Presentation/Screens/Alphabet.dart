import 'package:dictionary/Domain/cubit/apps_cubit.dart';
import 'package:flutter/material.dart';
import '../Shared/component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dictionary/Presentation/Shared/shared_preferences/shared_prefrences.dart';

//------------------------------------------------
class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CacheData.setData(key: 'key', value: false);
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.2,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/Image/bg1.jpg',)
                )
            ),
            child:
            SingleChildScrollView(
              child: Column(
                  children: [
                    homePageTitle(title: 'اختر أحد الحروف', isHome: true),
                    BlocProvider(
                      create: (context) => AppsCubit(),
                      child: boardAlphabet(context: context),
                    )
                  ]
              ),
            ),
          ),
        )
    );
  }
}
