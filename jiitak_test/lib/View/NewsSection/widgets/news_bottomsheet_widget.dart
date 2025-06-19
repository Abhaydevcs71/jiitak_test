import 'package:flutter/material.dart';
import 'package:jiitak_test/Model/news_model.dart';
import 'package:jiitak_test/viewmodel/common_view_model.dart';

class NewsBottomsheetWidget {
  //to view the full content of a particular News
  void showBottomSheet(
    BuildContext context,
    NewsData newsData,
    int index,
  ) {
    final CommonViewModel commonViewModel = CommonViewModel();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.9,
          maxChildSize: 0.95,
          minChildSize: 0.5,
          builder: (_, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsData.articles[index].title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: newsData.articles[index].urlToImage != null &&
                                  newsData.articles[index].urlToImage
                                      .toString()
                                      .isNotEmpty
                              ? NetworkImage(
                                      newsData.articles[index].urlToImage!)
                                  as ImageProvider
                              : const AssetImage(
                                  "assets/images/image_error_96.png"),//dispaly an error image when the response did not have an image Url
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    newsData.articles[index].content,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    newsData.articles[index].url,
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    commonViewModel
                        .formatUtcToLocal(newsData.articles[index].publishedAt),
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
