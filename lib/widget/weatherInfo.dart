import 'package:flutter/material.dart';
import 'package:weather_app3/models/weatherModel.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key , required this.weatherModel});
final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
             Text(weatherModel.country , style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),),
             Text("Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}" , style:const  TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //"assets/images/sunCloud.png"
                Image.network(getImages(weatherModel.image!), width: 100,height: 100,
                ),
                 Text("${weatherModel.degree}" , style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),),
                 Column(
                  children: [
                    Text("maxTemp: ${weatherModel.maxTemp.round()}"),
                    Text("minTemp:${weatherModel.minTemp.round()}"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text(weatherModel.conditional , style:const  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),),
          ],
        ),
      ),
    );
  }
  getImages(String value)
  {
    if(value.contains("https:"))
    {
      return value;
    }
    else{
      return "https:$value";
    }
  }
}
