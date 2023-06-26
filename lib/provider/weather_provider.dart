import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
    // ignore: unused_field
    WeatherModel? _weatherData ;  

    String? cityName ;
    set weatherData(WeatherModel? weather) {

      _weatherData =weather ;

      notifyListeners();

    }

    WeatherModel? get weatherData => _weatherData ;
}