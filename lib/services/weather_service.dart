import 'dart:convert';

import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:weather/Pages/search_page.dart';
import 'package:weather/models/weather_model.dart'; // 'as http' access in any point in the link

class WeatherServicse {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'bcd72ad349db4ed6928175641232306';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try{
      Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

    //parse بحول الرابط

    // ignore: unused_local_variable
    http.Response response = await http.get(url);

    // ignore: unused_local_variable
    Map<String, dynamic> data =jsonDecode(response.body); //key always String in the first palce


    // ignore: unused_local_variable
     weatherData= WeatherModel.fromJson(data);

    }catch(ex){
      print(ex);

    }

    return weatherData;
    

    //String temp =data['forecast']['forecastday'][0]['avgtemp_c'] ; // to access the first list  put 0 then put the key
  }
}
