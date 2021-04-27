import 'package:flutter/material.dart';
import 'package:restaurant_search/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const RoundedButton(
      {Key key, @required this.label, @required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          primary: color,
        ),
        child: Text(
          label,
          style: kTitleTextStyle.copyWith(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
