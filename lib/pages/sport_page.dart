// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_api_app/data/news_service.dart';
import 'package:news_api_app/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class SportPage extends StatefulWidget {
  const SportPage({Key? key}) : super(key: key);

  @override
  _SportPageState createState() => _SportPageState();
}

class _SportPageState extends State<SportPage> {
  List<Articles> articles = [];

  @override
  void initState() {
    NewsService.getSportNews().then((value) {
      setState(() {
        articles = value!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(articles[index].urlToImage ??
                        'https://i0.wp.com/designermenus.com.au/wp-content/uploads/2016/02/icon-None.png?w=300&ssl=1'),
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: Text(articles[index].title ?? ''),
                      subtitle: Text(articles[index].author ?? ''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(articles[index].description ?? ''),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        MaterialButton(
                            onPressed: () async {
                              await launch(articles[index].url ?? '');
                            },
                            child: Text('Habere Git')),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }
}
