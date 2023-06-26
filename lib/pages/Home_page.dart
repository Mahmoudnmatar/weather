import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';

import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_page.dart';
import 'package:weather/provider/weather_provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      updateUi: updateUi,
                    );
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: weatherData == null
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                  weatherData!.getThemeColor()[50]!,
                  
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                 ),

            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                   Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                   Text(
                    'Update at: ${weatherData!.date.toString()}',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text('${weatherData!.temp.toInt()}',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          )),
                      Column(
                        children: [
                          Text('Max = ${weatherData!.maxTemp.toInt()}'),
                          Text('Min = ${weatherData!.minTemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                      // weatherData?.weatherStateName?? ' ' ,//لو ما في قيمة اعرضلي فراغ
                      weatherData!.weatherStateName,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      )),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
