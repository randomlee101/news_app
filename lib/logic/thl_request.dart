import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants.dart';
import 'package:news_app/logic/thl.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/service_locator.dart';

fetchTopHeadLines() async
{
  TopHeadLinesBLoC topHeadLinesBLoC = locator.get<TopHeadLinesBLoC>();
  var url = Uri.parse(TOP_HEADLINES);
  var res = await http.get(url);
  var body = res.body;
  var data = json.decode(body);

  List<Articles> articles = data["articles"].map<Articles>((e) => Articles.fromJson(e)).toList();
  topHeadLinesBLoC.addTopHeadLines(articles);
}