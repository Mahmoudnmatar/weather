import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  // DateTime date ;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    // date = data['location']['localtime'];
    // temp = data['avgtemp_c'];
    // minTemp = jsonData['mintemp_c'];
    // maxTemp = jsonData['maxtemp_c'];
    // weatherStateName = jsonData['condition']['text'];

    return WeatherModel(
        // weatherStateName:data['weather_state_name'],
        // date : DateTime.parse(data['created']),
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        minTemp: jsonData['mintemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        weatherStateName: jsonData['condition']['text']); // to avoid the null state ? 
    
  }


  String getImage () {
    if(weatherStateName =='Clear' || weatherStateName == 'Light Cloud'){
      return 'assets/image/clear.png';
    }else if (weatherStateName=='Sleet' || weatherStateName == 'Snow' || weatherStateName=='Hail'){
      return 'assets/image/snow.png';
    }else if (weatherStateName == 'Heavy Cloud') {
      return'assets/image/cloudy.png' ;
    }else if (weatherStateName=='Light Rain'|| weatherStateName=='Heavy Rain' || weatherStateName=='Showers') {
      return 'assets/image/rainy.png';
    }else if (weatherStateName == 'Thunderstorm') {
      return 'assets/image/thunderstorm.png';
    }else{

      return 'assets/image/clear.png';
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'tem = $temp   minTemp = $minTemp   date = $date';
  }


  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (
        
        weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
