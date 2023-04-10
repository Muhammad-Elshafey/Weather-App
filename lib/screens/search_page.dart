import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
          ),
          child: TextFormField(
            autofocus: true,
            onChanged: (data)
            {
              cityName = data;
            },
            onFieldSubmitted: (data)
            async {
              cityName = data;

              WeatherServices service = WeatherServices();
              WeatherModel? weather = await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context , listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context , listen: false).cityName = cityName;
              Navigator.pop(context);
            },
            decoration:  InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () async
                  {
                    WeatherServices service = WeatherServices();
                    WeatherModel? weather = await service.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context , listen: false).weatherData = weather;
                    Provider.of<WeatherProvider>(context , listen: false).cityName = cityName;
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)
              ),
              label: const Text('Search'),
              hintText: 'Enter a City',
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}