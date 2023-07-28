import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news/Data/ApiManager.dart';
import 'package:news/Screens/Categories/categoryDM.dart';
import 'package:news/Screens/Categories/categoryScreen.dart';
import 'package:news/Screens/Categories/catrgoryItem.dart';
import 'package:news/Screens/Home/Tabs/details.dart';
import 'package:news/Screens/Home/home.dart';
import 'package:news/Screens/Settings/settingsProvider.dart';
import 'package:news/Screens/Settings/settingsScreen.dart';
import 'package:news/SourceResponce.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'Screens/Home/Tabs/NewsTab/newTab.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(

      ChangeNotifierProvider(
        create: (_)=> SettingsProvider(),
          child: MyApp()));
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
SettingsProvider provider=Provider.of(context);
    return

      MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    supportedLocales: [
      Locale('en'), // English
      Locale('ar'),
    ],
    locale: Locale(provider.currentLocale)
    ,
    debugShowCheckedModeBanner: false
    ,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        Details.routeName:(_)=>Details(),
        SettingScreen.routeName:(_)=>SettingScreen()

      },
      initialRoute: HomeScreen.routeName,

    );
  }

  void getAtricle(){}

  }




