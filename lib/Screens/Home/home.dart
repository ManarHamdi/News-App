

//Hello manooraa
import 'package:flutter/material.dart';
import 'package:news/Screens/Categories/categoryDM.dart';
import 'package:news/Screens/Home/Search/newsSearch.dart';
import 'package:news/Screens/Home/Tabs/Settings/settings.dart';
import 'package:news/Screens/Home/Tabs/NewsTab/newTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Screens/Settings/settingsScreen.dart';

import '../Categories/categoryScreen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "Home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  CategoryDM? selectedCategory= null;
  late Widget selectedTab;
@override
void initState() {
    // TODO: implement initState
    super.initState();
    selectedTab=CategoryScreen(setSelectedCategory);
  }
  Widget build(BuildContext context) {

    return
      WillPopScope(onWillPop: (){
        if (selectedTab is CategoryScreen){

return Future.value(true);
        }
        else {
          selectedTab=CategoryScreen(setSelectedCategory);
          setState(() {

          });
          return Future.value(false);
        }
      },
        child: Scaffold(
        appBar: AppBar(title: Text("News") , centerTitle: true ,actions: [
          IconButton(icon: Icon(Icons.search,size: 30),onPressed: ()=> showSearch(
            context:context,
            delegate:Search()
          )
           ,

          )
        ],
            shape: RoundedRectangleBorder
              (borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft: Radius.circular(8)))),
     
          body: selectedTab,
        drawer: buildDrawerWidget(),
    ),
      );
  }
  void setSelectedCategory (CategoryDM category) {
    selectedCategory=category;
    selectedTab=NewsTab(selectedCategory!);
    setState(() {

    });
  }
  buildDrawerWidget() {
    return
        Container(
          width: MediaQuery.of(context).size.width*.8,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height*.2,
                child: Center(child: Text("News App!", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),)),
              ),
              SizedBox(height: 26 ,),

                InkWell(onTap: (){
                  selectedCategory=null;
                  selectedTab=CategoryScreen(setSelectedCategory);
                  Navigator.pop(context);
                  setState(() {

                  });

                },
                    child: drawerRow(Icons.menu,AppLocalizations.of(context)!.categories )),


              SizedBox(height: 8,),

              InkWell(onTap: (){
                selectedCategory=null;
                selectedTab=SettingScreen();
                Navigator.pop(context);
                setState(() {

                });

              },
                  child: drawerRow(Icons.settings, AppLocalizations.of(context)!.settings))            ],
          ),
        );
  }

   drawerRow(IconData icon , String text) {

    return

           Row(children: [
              SizedBox(width: 8,),
              Icon(icon,color: Colors.black) ,
              SizedBox(width: 8,),

              Text(text , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),)
            ],
            )

        ;
  }
}


