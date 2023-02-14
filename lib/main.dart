import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/block_observer.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';

import 'modules/splash/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  bool? isDark= CacheHelper.getBoolean(key: "isDark");
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark,);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) =>  NewsCubit()..getBusiness()..getSports()
      ..getScience()..changeMode(fromShared:isDark ),
      child: BlocConsumer<NewsCubit,NewsStates>(
          listener:(context, state) {
      },
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:lightTheme,
          darkTheme: darkTheme,
          themeMode:NewsCubit.get(context)!.isDark ?ThemeMode.light:ThemeMode.dark,
          home:  const SplashScreen(),
        ) ;
      },

    ),
    );
  }
}
