import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';



void navigatorTo(context,widget)=> Navigator.push(context,
  MaterialPageRoute(
      builder:(context)=>widget
  ),
);


Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType keyboard,
  required String? Function(String?)? validate,
  void Function(String)? onSubmit,
  void Function(String)? onchange,
  void Function()? onTap,
  required String label,
  bool isClickable=true,
  required IconData? prefixIcon,
  void Function()? suffixPressed,
  IconData? suffixIcon,
  bool isPassword = false,
  Color? colorIcon ,
  Color? colorBorder,
}) => TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: colorIcon),
       enabledBorder: OutlineInputBorder(
        borderSide:BorderSide(
          color:colorBorder!
      )
       ),
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
          color: colorIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
        border: const OutlineInputBorder(),
      ),
    );

   Widget buildArticlesItem(articles,context)=>InkWell(
     onTap: (){
       navigatorTo(context, WebViewScreen(articles['url']));
     },
     child: Padding(
       padding: const EdgeInsets.all(20),
       child: Row(
         children: [
           Container(
             width: 120,
             height: 120,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 image:  DecorationImage(
                     image: articles['urlToImage'] == null
                         ? const NetworkImage(
                         'https://media.istockphoto.com/id/1357365823/vector/default-image-icon-vector-missing-picture-page-for-website-design-or-mobile-app-no-photo.jpg?b=1&s=170667a&w=0&k=20&c=LEhQ7Gji4-gllQqp80hLpQsLHlHLw61DoiVf7XJsSx0=')
                         : NetworkImage('${articles['urlToImage']}'),
                     fit: BoxFit.cover
                 )
             ),
           ),
           const SizedBox(
             width: 15,
           ),
           Expanded(
             child: SizedBox(
               height: 120,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children:  [
                   Expanded(
                     child: Text(
                       "${articles['title']}",
                       style:
                       TextStyle(
                           color:NewsCubit.get(context)!.isDark?Colors.black:Colors.white,
                       fontSize:17,fontWeight: FontWeight.bold),
                       /*Theme.of(context).textTheme.bodyText1,*/
                       maxLines:3,

                       overflow: TextOverflow.ellipsis,
                     ),
                   ),
                   const SizedBox(
                     height: 0,
                   ),
                   Text(
                     "${articles['publishedAt']}",
                     style: Theme.of(context).textTheme.caption,
                     ),


                 ],
               ),
             ),
           ),
         ],
       ),
     ),
   );


   Widget buildConditionBuilderForArticles(list,context,{isSearch=false})=>ConditionalBuilder(
     condition: list.length>0,
     builder: (context) =>  ListView.separated(
         physics: const BouncingScrollPhysics(),
         itemBuilder: (context, index) => buildArticlesItem(list[index],context),
         separatorBuilder: (context, index) => const SizedBox(height: 0,),
         itemCount: list.length) ,
     fallback:(context) => isSearch?Container(): const Center(child: CircularProgressIndicator()),);



