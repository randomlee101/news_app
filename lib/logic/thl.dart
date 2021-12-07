import 'package:news_app/models/articles.dart';
import 'package:rxdart/rxdart.dart';

class TopHeadLinesBLoC{

  var _topHeadLines = new BehaviorSubject<List<Articles>>();

  Stream<List<Articles>> get topHeadLines => _topHeadLines.stream;
  addTopHeadLines(List<Articles>? e) => _topHeadLines.sink.add(e!);

  dispose()
  {
    _topHeadLines.drain();
    _topHeadLines.close();
  }
}