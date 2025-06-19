import 'package:flutter/material.dart';

class NewsErrorWidget extends StatelessWidget {
  final void Function()? onPressedRetry;
  const NewsErrorWidget({super.key, this.onPressedRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Something Went Wrong!",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            onPressedRetry;
          },
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Image(
                        image: AssetImage("assets/images/document_error.png")),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Refresh",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.refresh,
                          color: Colors.blue,
                          size: 25,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
