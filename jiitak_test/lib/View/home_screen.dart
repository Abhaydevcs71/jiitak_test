import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jiitak_test/View/NewsSection/news_section.dart';
import 'package:jiitak_test/View/WeatherSection/weather_section.dart';
import 'package:jiitak_test/View/drawer/widgets/category_expantion_tile_widget.dart';
import 'package:jiitak_test/View/drawer/widgets/unit_expantion_tile_widget.dart';
import 'package:jiitak_test/viewmodel/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel controller = Get.put(HomeViewModel(context: context));
    return Scaffold(
      onEndDrawerChanged: (isOpened) async {
        if (!isOpened) {
          //to call the news api after selecting the categories
          debugPrint("Drawer Closed");
          await controller.fetchNews();
        }
      },
      endDrawer: SafeArea(
        //drawer for change user preferences and select categories
        child: Container(
          padding: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            border: Border(left: BorderSide(width: 1, color: Colors.grey)),
            color: Colors.grey[100]!.withAlpha(70),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * .6,
          child: Column(
            children: [
              UnitExpansionTile(homeViewModel: controller),
              CategoryExpansionTile(homeViewModel: controller)
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(4, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.deepPurple),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-4, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.deepPurple),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -1.2),
              child: Container(
                height: 300,
                width: 600,
                decoration: BoxDecoration(color: Color(0xFFFFAB40)),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: WeatherSection(
                        homeViewModel: controller,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: NewsSection(
                      homeViewModel: controller,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
