import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';


class SearchScreen extends StatelessWidget {
 final searchController=TextEditingController();
  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context, state) {},
      builder:(context, state) {
        var list =NewsCubit.get(context)?.search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextField(
                    controller: searchController,
                    keyboard: TextInputType.text,
                    colorBorder: NewsCubit.get(context)!.isDark?Colors.black:Colors.white,
                    onchange: (value){
                      NewsCubit.get(context)?.getSearch(value);
                    },
                    validate: (String? value){
                      if(value!.isEmpty){
                        return"Search must not be empty";
                      }
                      return null;
                    },
                    label: "Search",
                    prefixIcon: Icons.search,
                  colorIcon: NewsCubit.get(context)!.isDark?Colors.black:Colors.white,
                ),
              ),
              Expanded(
                  child:
                  buildConditionBuilderForArticles(list,context,isSearch:true))

            ],
          ),
        );
      } ,

    );
  }
}
