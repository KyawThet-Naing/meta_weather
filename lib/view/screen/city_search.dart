import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:meta_weather/data/models/city_model.dart';
import 'package:meta_weather/view/change_notifier/city_search_notifier.dart';
import 'package:provider/provider.dart';

import '../../utils/const.dart';
import '../widgets/city_card.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';

class CitySearch extends StatefulWidget {
  static const String route = "/";

  const CitySearch({Key? key}) : super(key: key);

  @override
  State<CitySearch> createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Const.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "City Name (Yangon)",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: _searchCity,
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Consumer<CitySearchNotifier>(
              builder: (ctx, citySearch, _) {
                if (citySearch.loading) {
                  return LoadingWidget(
                    color: Theme.of(context).primaryColor,
                  );
                } else if (citySearch.error) {
                  return const ErrorWidget();
                } else {
                  List<CityModel> cities = citySearch.cities;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: cities.length,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 10),
                      itemBuilder: (ctx, index) => CityCard(
                        city: cities[index],
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void _searchCity() {
    String city = searchController.text.trim();
    if (city.isEmpty) {
      var snackBar = const SnackBar(
        content: Text("Enter City Name"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    final citySearch = Provider.of<CitySearchNotifier>(context, listen: false);
    citySearch.searchCity(city: city);
  }
}
