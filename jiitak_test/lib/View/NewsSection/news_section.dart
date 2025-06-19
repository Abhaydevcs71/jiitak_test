import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitak_test/View/NewsSection/widgets/news_error_widget.dart';
import 'package:jiitak_test/View/NewsSection/widgets/news_list_widget.dart';
import 'package:jiitak_test/viewmodel/home_view_model.dart';

class NewsSection extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const NewsSection({super.key, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24),
      ),
      child: Obx(
        () {
          final newsData = homeViewModel.newsData.value;

          if (homeViewModel.isNewsLoading.value == true) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          } else if (newsData == null) {
            // Show a error widget when data fetching got error and an option for retry
            return NewsErrorWidget(
              onPressedRetry: () async {
                await homeViewModel.fetchNews();
              },
            );
          } else {
            return Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white24),
              ),
              child: NewsListWidget(newsdata: newsData),
            );
          }
        },
      ),
    );
  }
}
