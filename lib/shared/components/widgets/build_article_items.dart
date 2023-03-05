import 'package:flutter/material.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../modules/web_view/web_view_screen.dart';
import 'custom_navigation_to.dart';

class BuildArticleItems extends StatelessWidget {
   BuildArticleItems(this.articles,{Key? key}) ;
dynamic articles;
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                        style:Theme.of(context).textTheme.bodyText1,
                        // TextStyle(
                        //     color: NewsCubit.get(context)!.isDark?Colors.black:Colors.white,
                        //     fontSize:17,fontWeight: FontWeight.bold),
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
  }
}
