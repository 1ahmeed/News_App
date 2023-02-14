import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

import '../../layout/news_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            body: EasySplashScreen(
              logo: Image.asset('assets/images/aa.webp',),
              backgroundColor:Colors.grey[300]! ,
              durationInSeconds:3 ,
              logoWidth: 70,
              showLoader: false,
              navigator: NewsLayout(),
            ),

          );

      },

    );
  }
}