import 'package:flutter/material.dart';
import 'package:jiitak_test/Model/news_model.dart';
import 'package:jiitak_test/View/NewsSection/widgets/news_box_widget.dart';
import 'package:number_paginator/number_paginator.dart';

class NewsListWidget extends StatefulWidget {
  final NewsData newsdata;
  const NewsListWidget({super.key, required this.newsdata});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  int _currentPage = 0;
  final int _itemsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    final totalItems = widget.newsdata.articles.length;
    final totalPages = (totalItems / _itemsPerPage).ceil();

    // Get the items for the current page
    final startIndex = _currentPage * _itemsPerPage;
    final endIndex = (_currentPage + 1) * _itemsPerPage;
    final pageItems = widget.newsdata.articles.sublist(
      startIndex,
      endIndex > totalItems ? totalItems : endIndex,
    );

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: pageItems.length,
            itemBuilder: (context, index) {
              return NewsBoxWidgets(
                newsData: widget.newsdata,
                index: startIndex + index,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: NumberPaginator(
            numberPages: totalPages,
            initialPage: _currentPage,
            onPageChange: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            child: const SizedBox(
              height: 48,
              child: Row(
                children: [
                  PrevButton(),
                  Expanded(
                    child: NumberContent(),
                  ),
                  NextButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
