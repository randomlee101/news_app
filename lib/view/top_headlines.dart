import 'package:flutter/material.dart';
import 'package:news_app/logic/thl.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/service_locator.dart';

class TopHeadLines extends StatelessWidget {
  TopHeadLines({Key? key}) : super(key: key);

  TopHeadLinesBLoC topHeadLinesBLoC = locator.get<TopHeadLinesBLoC>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: const Text("Top Headlines"),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: StreamBuilder<List<Articles>>(
        stream: topHeadLinesBLoC.topHeadLines,
        builder: (context, snapshot) => ListView(
          children: snapshot.data!
              .map((e) => Container(
                    padding: EdgeInsets.all(16),
                    height: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                          child: Image.network(
                            "${e.urlImage}",
                            errorBuilder: (context, obj, st) => const SizedBox(),
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.black, Colors.transparent])),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${e.title}",
                                softWrap: true,
                                style: const TextStyle(color: Colors.white, wordSpacing: 1.2, fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ))
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
