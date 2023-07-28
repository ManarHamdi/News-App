import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Screens/Settings/settingsProvider.dart';
import 'package:news/Screens/Settings/theme%20botton%20sheet.dart';
import 'package:provider/provider.dart';

import 'language bottom sheet.dart';

class SettingScreen extends StatefulWidget{
  static const String routeName="Setting";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return
      Container(padding: EdgeInsets.only(top: MediaQuery.of(context)!.size.height*.1, right: 18 ,left: 18),
        margin: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [SizedBox(height: 22),

            Text(AppLocalizations.of(context)!.language,style: Theme.of(context)!.textTheme.titleMedium,),
            SizedBox(height: 16,),
            Form(child:Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
              Container(height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                child:

                InkWell(onTap:(){
                  onLanguageRowClick();
                } ,
                  child: Row(children: [SizedBox(width: 20),
                    getRowOption(provider.currentLocale=="en"? "English" : "العربية"),
                    Spacer(flex: 2),

                    Icon(Icons.arrow_drop_down_outlined,)]),
                ),
              )],),
            )
            ,SizedBox(height: 30,),
            Text(AppLocalizations.of(context)!.mode,style: Theme.of(context)!.textTheme.titleMedium),
            SizedBox(height: 16,),
            Container(decoration: BoxDecoration(border: Border.all(color: Colors.blue),),
                height: 50,child:

                InkWell(onTap:(){
                  onThemeRowClick();
                } ,
                  child: Row(children: [SizedBox(width: 20),
                    Text(AppLocalizations.of(context)!.light,style: Theme.of(context)!.textTheme.bodySmall),
                    Spacer(flex: 2),

                    Icon(Icons.arrow_drop_down_outlined,)],),
                ))
          ]
          ,
        ),
      );
  }

  void onLanguageRowClick() {
    showModalBottomSheet(context: context, builder: (context){
      return LanguageBottomSheet(

      );
    });
  }

  void onThemeRowClick() {
    showModalBottomSheet(context: context, builder: (context){
      return ThemeBottomSheet();
    });
  }

  getRowOption(String selectedLang) {
    if (selectedLang=="English") {
      return Text("English", style:Theme.of(context)!.textTheme.bodySmall );

    }
    else {
      return Text( "العربية",style:Theme.of(context)!.textTheme.bodySmall
      ) ;
    }
  }
}

