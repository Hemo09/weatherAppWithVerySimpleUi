import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app3/cubit/weatherStates.dart';
import 'package:weather_app3/views/search.dart';
import 'package:weather_app3/weatherServices.dart';

class WeatherCubit extends Cubit<WeatherStates>
{
  WeatherCubit():super(NoWeatherData());
   void getData({required String? cityName})
   async{
    try{
      weatherModel = await WeatherServices(dio: Dio()).getCurrentWeather(cityName: cityName!);
      emit(WeatherLoadedData(weatherModel!));
    } catch(e)
    {
      emit(WeatherFail());
    }

   }
}