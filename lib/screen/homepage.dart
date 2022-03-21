import 'package:flutter/material.dart';
import 'package:news_app_x/model/article.dart';
import 'package:news_app_x/service/data_service.dart';

import 'newspage.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo4zGSr25cTfr__JnNBlxju18g9geM7uir_g&usqp=CAU'),
                  //https://media-exp1.licdn.com/dms/image/C5603AQE01nSH7JQImA/profile-displayphoto-shrink_800_800/0/1617547764581?e=1652313600&v=beta&t=02ylcCNN_V2WyjWX9HRJRE9zuxyIVLhi26Er3ZKkwCg
            ),
          ),
          width: 10,
          margin: EdgeInsets.all(5),
        ),
        title: Text(
          'Good Morning',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark,
                color: Colors.blue,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshot) => snapshot.data != null
            ? NewsPage(snapshot.data as List<Article>)
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
