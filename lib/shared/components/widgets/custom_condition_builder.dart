import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'build_article_items.dart';

class CustomConditionBuilder extends  StatelessWidget {
   CustomConditionBuilder(this.list,{Key? key,this.isSearch=false});
   dynamic list;
   bool isSearch;
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.length>0,
      builder: (context) =>  ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => BuildArticleItems(list[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 0,),
          itemCount: list.length) ,
      fallback:(context) => isSearch?Container(): const Center(child: CircularProgressIndicator()),);
  }
}
