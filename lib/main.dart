import 'package:flutter/material.dart';
import 'package:meta_weather/utils/routes.dart';
import 'package:meta_weather/view/widgets/provider_widget.dart';
import '/utils/const.dart';

void main() => runApp(const MetaWeather());

class MetaWeather extends StatelessWidget {
  const MetaWeather({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      child: MaterialApp(
        title: Const.title,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        theme: ThemeData(primarySwatch: Colors.indigo),
      ),
    );
  }
}
