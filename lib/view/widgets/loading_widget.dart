import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double topPadding;
  final Color color;

  const LoadingWidget(
      {Key? key, this.topPadding = 60, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
