import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/Home_page.dart';
import 'package:weather/provider/weather_provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
    create:(context) {
        return WeatherProvider();
      },

  child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // ignore: unused_local_variable
    WeatherModel? weather ;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ?  Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
