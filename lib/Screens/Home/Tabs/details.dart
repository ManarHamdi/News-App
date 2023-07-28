import 'package:flutter/material.dart';
import 'package:news/Data/ArticlesResponceDM.dart';
import 'package:news/SourceResponce.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Categories/categoryDM.dart';

class Details extends StatelessWidget{
  static String routeName ="details";
  @override
  Widget build(BuildContext context) {
    var article=ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold( appBar: AppBar(title: Text(article.title??"News") , centerTitle: true ,
        shape: RoundedRectangleBorder
          (borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft: Radius.circular(8)))),
       body:
           
       SingleChildScrollView(
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
               ,SizedBox(height: 12)
               ,Text(article.author??"",style: TextStyle(fontSize: 12),textAlign: TextAlign.start )
               ,
               SizedBox(height: 8)
               ,Text(article!.title??"",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.start)
               ,SizedBox(height: 8),

               Text(article.publishedAt??"",textAlign: TextAlign.end,style: TextStyle(fontSize: 12),)
               ,SizedBox(height: 8),
               SizedBox(height: 35,),
               Text(article.content??""),
               SizedBox(height: 30,),
               Row(mainAxisAlignment:MainAxisAlignment.end ,
                 children: [
                   TextButton(child: Text("View Full Article",style: TextStyle(color: Colors.black)),
                   onPressed: (){
                     getLaunchURL(article.url);
                   },),
                   Icon( Icons.arrow_right)
                 ],
               )

             ],
           ),




  ),
       ));  } // )

Future<void> getLaunchURL (String? url) async {
if(url==null) return ;
var uri=Uri.parse(url);
if(await canLaunchUrl(uri)){
  launchUrl(uri);
}

}
  }

