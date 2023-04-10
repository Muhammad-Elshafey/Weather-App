import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';


class WeatherServices
{

  String baseUrl = 'http://api.weatherapi.com/v1';

  String apiKey = 'a9c8473dac1c477e9fb224112230704';


  Future<WeatherModel?> getWeather({required String cityName})
  async {
    WeatherModel? weather;
    try{
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=4'
      );
      http.Response response = await http.get(url);
      Map<String , dynamic> data = jsonDecode(response.body);


       weather = WeatherModel.fromJson(data);
    }
    catch(e){

    }
    return weather;
  }
}