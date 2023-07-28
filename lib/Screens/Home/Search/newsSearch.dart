import 'package:flutter/material.dart';

import '../../../Data/ApiManager.dart';
import '../../../Data/ArticlesResponceDM.dart';
import '../../../SourceResponce.dart';
import '../Tabs/details.dart';

class Search extends SearchDelegate{


  @override
  List<Widget>? buildActions(BuildContext context) {
return
    [
  IconButton(onPressed: ()
      {
        showResults(context);
  },
      icon: Icon(Icons.search,size: 25,))
];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(icon: Icon(Icons.close_outlined,size: 25,),onPressed: (){
        Navigator.of(context).pop();
      },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder <ArticlesResponceDm> (
        future: ApiManager.getArticles(searchKeyWord: query)
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
  
});}

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
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
                    ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.network(fit: BoxFit.fill,height: MediaQuery.of(context).size.height*.25,article.urlToImage??"https://pioneer-technical.com/wp-content/uploads/2016/12/news-placeholder.png"))
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

