import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app3/cubit/weatherCubit.dart';
import 'package:weather_app3/cubit/weatherStates.dart';
import 'package:weather_app3/views/search.dart';
import '../widget/noWeatherBody.dart';
import '../widget/weatherInfo.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (c)=>SearchView()));
            },
              icon: const Icon(Icons.search_outlined , size: 35,)),
        ],
        title: const Text("WeatherApp"),
      ),
      body:BlocBuilder<WeatherCubit , WeatherStates>(
          builder: (context , state){
            if(state is WeatherLoadedData)
            {
              return  WeatherInfo(
                weatherModel: state.weatherModel,
              );
            }
            else if(state is NoWeatherData)
            {
              return const NoWeatherBody();
            }
            else
            {
              return const Center(child: Text("oops there is an error 😔" , style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26,
                color: Colors.grey,
              ),),);
            }
          },
      ),
    );
  }
}
