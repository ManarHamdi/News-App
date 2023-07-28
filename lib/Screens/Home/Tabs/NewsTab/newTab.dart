import 'package:flutter/material.dart';
import 'package:news/Data/ApiManager.dart';
import 'package:news/Screens/Categories/categoryDM.dart';
import 'package:news/Screens/Home/Tabs/NewsTab/NewsViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../SourceResponce.dart';
import '../../../getArticleScreen.dart';

class NewsTab extends StatefulWidget {
static String routeName="News tab";
CategoryDM selectedCategory ;
NewsTab(this.selectedCategory);
  @override
  State<NewsTab> createState() => _NewsTabState();
}
class _NewsTabState extends State<NewsTab> {
NewsViewModel viewModel =NewsViewModel();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.selectedCategory.id);
  }
@override
  Widget build(BuildContext context) {
    return 
      ChangeNotifierProvider(
          create: (context) => viewModel,
          builder:(context,_) {
            viewModel=Provider.of(context);
            if (!viewModel.isLoading) {
              if(viewModel.errorMessage.isEmpty){
                return getScreenBody(viewModel.sources);
              }
              else{
                return getErrotStete(viewModel.errorMessage);
              }
            }
            else
              {
                return
                    Center(child: CircularProgressIndicator());
              }
          }
      );
  }

Widget getErrotStete (String message){
  return Text(message);
}
  Widget getScreenBody(List<Sources> sources) {
    return DefaultTabController(length: sources!.length!,
        child: Column(children: [
          TabBar(indicatorColor: Colors.transparent,isScrollable: true,tabs: sources.map((source) {

            return getTab(source,viewModel.currentTab==sources.indexOf(source));}).toList(),
            onTap: (index){
            viewModel.currentTab=index;
            setState(() {

            });
            },
          ),
          Expanded(
            child: TabBarView(children:
            sources.map((source) {
              return GetArticleScreen(source);
            }).toList()
            ),
          )
        ],)
    );
  }


  Widget getTab(Sources source, bool isSellected) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
border: Border.all(color: Colors.blue , width: 1),
           color:isSellected? Colors.blue: Colors.white),
padding:EdgeInsets.all(8),
      margin: EdgeInsets.all(14),

      child: Text(source.name!, style: TextStyle(color: isSellected? Colors.white: Colors.blue)),
    );
  }}

