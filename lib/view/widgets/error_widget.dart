import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final double topPadding;

  const ErrorWidget({Key? key, this.topPadding = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: const Center(child: Text("Something is not right.")),
    );
  }
}
