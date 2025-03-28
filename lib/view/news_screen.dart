import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/widgets/my_text.dart';

import '../widgets/appbar.dart';


class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> news = [
      {'title': 'Tech Giants Merge', 'content': 'Two major tech companies have announced their merger...'},
      {'title': 'SpaceX Successfully', 'content': 'SpaceX has successfully landed its latest rocket...'},
    ];

    return Scaffold(
     appBar: simpleAppBar(title: 'News'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: news.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: MyText(text:news[index]['title']!,size: 18.sp,weight: FontWeight.w600, ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {


              Get.to(()=>NewsDetailScreen(news[index]));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => NewsDetailScreen(news[index])),
              // );
            },
          );
        },
      ),
    );
  }
}

class NewsDetailScreen extends StatelessWidget {
  final Map<String, String> newsItem;
  const NewsDetailScreen(this.newsItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: newsItem['title']!),
      body: Padding(
        padding:  EdgeInsets.all(16.sp),
        child: MyText(text: newsItem['content']!,size: 16.sp,),
      ),
    );
  }
}
