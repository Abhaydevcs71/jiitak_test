import 'package:flutter/material.dart';

class LoactionDeniedWidget extends StatelessWidget {
  final void Function()? onPressedRetry;
  const LoactionDeniedWidget({super.key, this.onPressedRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Location Permission Denied",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Column(
          children: [
            Center(
              child: Column(
                children: [
                  InkWell(
                      onTap: onPressedRetry,
                      child: Image(
                          image:
                              AssetImage("assets/images/location_error.png"))),
                  InkWell(
                    onTap: onPressedRetry,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Retry",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.refresh,
                          size: 25,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Go to Settings and allow Location",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
