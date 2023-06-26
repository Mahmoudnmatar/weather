import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {

  String? cityName;

  SearchPage({this.updateUi ,});

  VoidCallback? updateUi ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: TextField(
            onChanged: (data){
              cityName = data ;
            },
            onSubmitted: (data) async{
              cityName = data ;

              WeatherServicse servicse = WeatherServicse();
              // ignore: unused_local_variable
              WeatherModel? weather = await  servicse.getWeather(cityName: cityName!) ;

              //  weatherData = weather ;

               Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
               Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;

              //  updateUi!();

              Navigator.pop(context);

            },
            decoration:    InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              label: Text('search'),
              border: OutlineInputBorder(),
              hintText: 'Enter a City',
              suffixIcon: GestureDetector(
                onTap: () async{
                  
              WeatherServicse servicse = WeatherServicse();
              WeatherModel? weather = await  servicse.getWeather(cityName: cityName!) ;


               Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
               Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;


              Navigator.pop(context);

                },
                child: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}


// WeatherModel? weatherData ;