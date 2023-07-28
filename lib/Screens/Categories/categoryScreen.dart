
import 'package:flutter/material.dart';
import 'package:news/Screens/Categories/categoryDM.dart';
import 'package:news/Screens/Categories/catrgoryItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryScreen extends StatelessWidget{
 static String routeName = "Category";
 Function (CategoryDM)onCategoryClick;
 CategoryScreen(this.onCategoryClick);
  @override
  Widget build(BuildContext context) {
    return

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(AppLocalizations.of(context)!.pickyourcategoryofinterest,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold)),
            ),
            
            Expanded(

              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8,mainAxisSpacing: 8),


                  itemCount: 6,
                  itemBuilder: (context,index){
                    return
                      InkWell(onTap: (){
                        onCategoryClick(CategoryDM.categories[index]);
                      },
                          child: CategoryItem(CategoryDM.categories[index]))
                    ;
                  },
                ),
              ),
            )


          ]);


  }

}