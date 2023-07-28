import 'package:flutter/material.dart';
import 'package:news/Data/ApiManager.dart';

import '../../../../SourceResponce.dart';

class NewsViewModel extends ChangeNotifier {
  List<Sources> sources =[];
  int currentTab=0;
  String errorMessage='';
  bool isLoading=false;

  void getSources(String categoryID)async{
    isLoading =true;
    SourceResponce sourceResponce=await ApiManager.getSources(categoryID);
    if(sourceResponce.message!=null|| sourceResponce.code!=null){
      errorMessage=sourceResponce.message!;
      //There is something wrong with the error state it doesnot work
    }
    else {
      sources = sourceResponce.sources!;
    }
    isLoading=false;
    notifyListeners();
  }

}