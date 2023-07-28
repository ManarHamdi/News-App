// da bgm3 feh kol el api elly m3aya f elproject w bykon Abstract w  asamy el func elgowa static...



import 'dart:convert';

import '../SourceResponce.dart';
import 'package:http/http.dart' as http;

import 'ArticlesResponceDM.dart';

abstract class ApiManager {
  static String baseURL ="newsapi.org";
  static String apiKey ="c55dad1a4b984e689354bcb55d652d4d";

 static Future<SourceResponce> getSources(categoryID) async {
    var url = Uri.https(baseURL, 'v2/top-headlines/sources',
        {
          "apiKey":apiKey,
          "category": categoryID,
        }
    );
    http.Response responce = await http.get(url);
    Map json = jsonDecode(responce.body) as Map;
    print("source responce  $json");
    var sourceResponce = SourceResponce.fromJson(json);
    return sourceResponce;
  }


  static Future<ArticlesResponceDm> getArticles ({String? sourceID, searchKeyWord})async {

    var url = Uri.https(baseURL, 'v2/everything',
        {
          "apiKey":apiKey,
          "sources":sourceID,
          "q":searchKeyWord
        }
    );
    http.Response responce = await http.get(url);
    Map json = jsonDecode(responce.body) as Map;

    var articleResponce = ArticlesResponceDm.fromJson(json);

    return articleResponce;
  }
}