import 'package:flutter/material.dart';
import 'package:news/Screens/Categories/categoryDM.dart';
import 'package:news/Screens/Home/Tabs/details.dart';
import 'package:news/Screens/Home/Tabs/NewsTab/newTab.dart';

class CategoryItem extends StatelessWidget{
  static String routeName ="category item";

  CategoryDM categoryDM ;
  CategoryItem(this.categoryDM);
  @override
  Widget build(BuildContext context) {
    return


         Container(
          padding: EdgeInsets.only(bottom: 8),
decoration: BoxDecoration(color:categoryDM.backGround ,borderRadius: BorderRadius.only(

  topLeft: Radius.circular(12),
  topRight: Radius.circular(12),
  bottomLeft: categoryDM.isLeft? Radius.circular(12):Radius.zero
    ,bottomRight: categoryDM.isLeft?Radius.zero:Radius.circular(12)

)),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,children: [
              Spacer(),
          Image(image: AssetImage(categoryDM.ImagePath),height: 100),
          Spacer(),
          Text(categoryDM.title,style: TextStyle(color: Colors.white,fontSize: 18),)
        ]),
    )
      ;
      }

}