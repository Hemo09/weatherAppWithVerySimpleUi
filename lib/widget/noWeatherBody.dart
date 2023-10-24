import 'package:flutter/material.dart';
import 'package:weather_app3/views/search.dart';
class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text.rich(TextSpan(
             children: [
              TextSpan(text: "there is no weather 😞 " , style: TextStyle(
                fontSize: 23 ,
                fontWeight: FontWeight.bold,
              )),
               TextSpan(text: "start \n Searching now 🔍 ",style: TextStyle(
                 fontSize: 23 ,
                 fontWeight: FontWeight.bold,
               )),
             ],
          ))
        ],
      ),
    );
  }
}
