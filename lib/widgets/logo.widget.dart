import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String logo = 'assets/logo.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              logo,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
