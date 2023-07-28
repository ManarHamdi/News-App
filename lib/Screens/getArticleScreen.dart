import 'package:flutter/material.dart';
import 'package:news/Screens/Home/Tabs/details.dart';

import '../Data/ApiManager.dart';
import '../Data/ArticlesResponceDM.dart';
import '../SourceResponce.dart';

class GetArticleScreen extends StatelessWidget{
  Sources source ;
  GetArticleScreen(this.source);
  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder <ArticlesResponceDm> (
    future: ApiManager.getArticles(sourceID: source.id)
    ,builder: (context,snapshot){
      if (snapshot.hasError){
        return Text(snapshot.error.toString());
      }
      else if(snapshot.hasData){
        return ListView.builder(
          itemCount: snapshot.data!.articles!.length,
            itemBuilder: (context, int index) {
            return
              articleItem(context,snapshot.data!.articles![index] );
            }) ;
      }
      else{
        return Center(child: CircularProgressIndicator());
      }
    }
    );
    
  }

  Widget articleItem(context,Articles article) {

    return

         InkWell(onTap: (){
           Navigator.of(context).pushNamed(Details.routeName,arguments: article);
         },
           child: Container(
        margin: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Stack(
              alignment:Alignment.center ,
              children: [
                  Center(child: CircularProgressIndicator()),
                ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.network(fit: BoxFit.fill,height: MediaQuery.of(context).size.height*.25,
                    article.urlToImage??"https://pioneer-technical.com/wp-content/uploads/2016/12/news-placeholder.png"))
                ])
                ,SizedBox(height: 8)
                  ,Text(article.author??"",style: TextStyle(fontSize: 12),textAlign: TextAlign.start )
                  ,
                  SizedBox(height: 8)
                  ,Text(article!.title??"",style: TextStyle(fontSize: 12),textAlign: TextAlign.start)
              ,SizedBox(height: 8),

              Text(article.publishedAt??"",textAlign: TextAlign.end,style: TextStyle(fontSize: 12),)
              ,SizedBox(height: 8)

              ],
            ),




    ),
         )
      ;
  }
  
}