import 'package:dictionary/Core/Theme_light/Theme_light_colors.dart';
import 'package:dictionary/Domain/cubit/apps_cubit.dart';
import 'package:flutter/material.dart';
import '../Shared/component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/wordInfo.dart';
//---------------------------------------------
class WordDetails extends StatelessWidget {
  const WordDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppsCubit(),
      child: BlocConsumer<AppsCubit, AppsState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.4),
                    image: const DecorationImage(
                        opacity: 0.1,
                        fit: BoxFit.fill,
                        image: AssetImage('assets/Image/Img.jpg',)
                    )
                ),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailedTitle(),
                    WordInfo(),
                    storyDesign(),
                    storyBody(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}










