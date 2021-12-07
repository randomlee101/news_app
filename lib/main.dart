import 'package:flutter/material.dart';
import 'package:news_app/logic/thl_request.dart';
import 'package:news_app/service_locator.dart';
import 'package:news_app/view/top_headlines.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  await fetchTopHeadLines();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TopHeadLines(),
      debugShowCheckedModeBanner: false,
    );
  }
}
