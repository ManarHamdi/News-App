
import 'package:flutter/material.dart';
class CategoryDM   {
  String id;
String ImagePath ;
String title;
Color backGround;
bool isLeft;
CategoryDM({required this.id,required this.ImagePath,required this.title,required this.backGround,required this.isLeft});

static List<CategoryDM> categories =[
  CategoryDM(id: 'sports',ImagePath: "assets/image/ball@2x.png",title: "Sports",backGround: Colors.red[900]! ,isLeft:  true),
  CategoryDM(id: 'entertainment',ImagePath:"assets/image/Politics.png", title:"Technology",backGround:Colors.blue[900]! , isLeft:false),
  CategoryDM(id: 'health',ImagePath:"assets/image/health@2x.png", title:"Health",backGround:Colors.pink , isLeft:true),
  CategoryDM(id: 'business',ImagePath:"assets/image/bussines@2x.png", title:"Business", backGround:Colors.orange[900]!,isLeft: false),
  CategoryDM(id: 'environment',ImagePath:"assets/image/environment@2x.png", title:"Environment", backGround:Colors.lightBlue, isLeft:true),
  CategoryDM(id: 'science',ImagePath:"assets/image/science.png", title:"Science", backGround:Colors.yellow[500]!, isLeft:false),



];

}