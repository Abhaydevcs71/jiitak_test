import 'package:flutter/material.dart';
import 'package:jiitak_test/Model/news_model.dart';
import 'package:jiitak_test/View/NewsSection/widgets/news_bottomsheet_widget.dart';

class NewsBoxWidgets extends StatelessWidget {
  final NewsData newsData;
  final int index;
  const NewsBoxWidgets({
    super.key,
    required this.newsData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final NewsBottomsheetWidget newsBottomsheetWidget = NewsBottomsheetWidget();
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: 100,
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: newsData.articles[index].urlToImage != null &&
                        newsData.articles[index].urlToImage
                            .toString()
                            .isNotEmpty
                    ? NetworkImage(newsData.articles[index].urlToImage!)
                        as ImageProvider
                    : const AssetImage("assets/images/image_error_96.png"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        newsData.articles[index].title,
                        style: TextStyle(color: Colors.white),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                        onTap: () => newsBottomsheetWidget.showBottomSheet(
                            context, newsData, index),
                        child: Text(
                          "Show More",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          indent: 10,
          endIndent: 10,
          color: Colors.white,
        )
      ],
    );
  }
}
