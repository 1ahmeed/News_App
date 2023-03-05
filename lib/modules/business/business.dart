import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import '../../shared/components/widgets/custom_condition_builder.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
        builder: (context, state) {
        var list=NewsCubit.get(context)?.business;
          return CustomConditionBuilder(list) ;
        }, );

  }
}
