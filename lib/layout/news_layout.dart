

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
        var cubit = NewsCubit.get(context);

          return Scaffold(
            // key: ,
            appBar: AppBar(
              //backgroundColor: Colors.white,
              title: const Text("News"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, size: 30,),
                  onPressed: () {
                   navigatorTo(context, SearchScreen());
                  },),
                IconButton(
                  icon: const Icon(Icons.brightness_4_outlined, size: 30,),
                  onPressed: () {
                    NewsCubit.get(context)?.changeMode();
                  },)
              ],
            ),

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit!.currentIndex,
              onTap: (index) {
                cubit.changeCurrentIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.business,),
                  label: 'Business',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports,),
                  label: 'Sports',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.science_outlined,),
                  label: 'Science',

                ),

              ],
            ),
            body: cubit.screens![cubit.currentIndex],


          );
        });
  }


}
