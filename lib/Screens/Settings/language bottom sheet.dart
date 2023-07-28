
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Screens/Settings/settingsProvider.dart';
import 'package:provider/provider.dart';


class LanguageBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);

    return Container(padding: EdgeInsets.only(top: 19),

  child:   Column(children: [
    Text("Select your language" , textAlign: TextAlign.center,style: Theme.of(context)!.textTheme.titleMedium,),
    SizedBox(height: 30),

    InkWell(onTap:(){
      provider.currentLocale="en";
      provider.notifyListeners();
    } ,child:     onLanguageClickStyle(provider.currentLocale=="en","English") ,
        ),


    SizedBox(height: 8),

    InkWell(onTap: () {
      provider.currentLocale="ar";
      provider.notifyListeners();
    },
      child:    onLanguageClickStyle(provider.currentLocale=="ar","العربية"),
        )


  ],),
);
  }

  onLanguageClickStyle(bool isSelected,String language) {
    if (isSelected) {
      return
        Text(language , style: TextStyle(color: Colors.blue ,fontSize: 24));
    }
    else {
      return
      Text(language , style: TextStyle(color: Colors.black ,fontSize: 24));
    }
  }
}