import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? CityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data) async {
              CityName = data;
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: CityName!);

              Provider.of<WeatherProvider>(context).weatherData = weather;
              //weatherData = weather;
              updateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              label: Text('search'),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter a City',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

//WeatherModel? weatherData;
