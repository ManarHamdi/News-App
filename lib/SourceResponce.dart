import 'dart:convert';
/// status : "ok"
/// sources : [{"id":"abc-news","name":"ABC News","description":"Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.","url":"https://abcnews.go.com","category":"general","language":"en","country":"us"},{"id":"abc-news-au","name":"ABC News (AU)","description":"Australia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more.","url":"http://www.abc.net.au/news","category":"general","language":"en","country":"au"},{"id":"aftenposten","name":"Aftenposten","description":"Norges ledende nettavis med alltid oppdaterte nyheter innenfor innenriks, utenriks, sport og kultur.","url":"https://www.aftenposten.no","category":"general","language":"no","country":"no"},{"id":"al-jazeera-english","name":"Al Jazeera English","description":"News, analysis from the Middle East and worldwide, multimedia and interactives, opinions, documentaries, podcasts, long reads and broadcast schedule.","url":"http://www.aljazeera.com","category":"general","language":"en","country":"us"},{"id":"ansa","name":"ANSA.it","description":"Agenzia ANSA: ultime notizie, foto, video e approfondimenti su: cronaca, politica, economia, regioni, mondo, sport, calcio, cultura e tecnologia.","url":"http://www.ansa.it","category":"general","language":"it","country":"it"},{"id":"argaam","name":"Argaam","description":"ارقام موقع متخصص في متابعة سوق الأسهم السعودي تداول - تاسي - مع تغطيه معمقة لشركات واسعار ومنتجات البتروكيماويات , تقارير مالية الاكتتابات الجديده ","url":"http://www.argaam.com","category":"business","language":"ar","country":"sa"},{"id":"ars-technica","name":"Ars Technica","description":"The PC enthusiast's resource. Power users and the tools they love, without computing religion.","url":"http://arstechnica.com","category":"technology","language":"en","country":"us"}]

SourceResponce sourceResponceFromJson(String str) => SourceResponce.fromJson(json.decode(str));
String sourceResponceToJson(SourceResponce data) => json.encode(data.toJson());
class SourceResponce {
  SourceResponce({
      this.status, 
      this.sources,
      this.code,
      this.message
  });

  SourceResponce.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      code = json['code'];
      message = json['message'];
      json['sources'].forEach((v) {
        sources?.add(Sources.fromJson(v));

      });
    }
  }
  String? status;
  List<Sources>? sources;
  String? code;
  String? message;
SourceResponce copyWith({  String? status,
  List<Sources>? sources,String? code,String? message
}) => SourceResponce(  status: status ?? this.status,
  sources: sources ?? this.sources, code: code ?? this.code, message: message ?? this.message
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "abc-news"
/// name : "ABC News"
/// description : "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com."
/// url : "https://abcnews.go.com"
/// category : "general"
/// language : "en"
/// country : "us"

Sources sourcesFromJson(String str) => Sources.fromJson(json.decode(str));
String sourcesToJson(Sources data) => json.encode(data.toJson());
class Sources {
  Sources({
      this.id, 
      this.name, 
      this.description, 
      this.url, 
      this.category, 
      this.language, 
      this.country,});

  Sources.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;
Sources copyWith({  String? id,
  String? name,
  String? description,
  String? url,
  String? category,
  String? language,
  String? country,
}) => Sources(  id: id ?? this.id,
  name: name ?? this.name,
  description: description ?? this.description,
  url: url ?? this.url,
  category: category ?? this.category,
  language: language ?? this.language,
  country: country ?? this.country,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['url'] = url;
    map['category'] = category;
    map['language'] = language;
    map['country'] = country;
    return map;
  }

}