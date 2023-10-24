import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'models/weatherModel.dart';

class WeatherServices
{
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "3844f3609b624845a4593325231210";
  WeatherServices({required this.dio});
  Future<WeatherModel?> getCurrentWeather({ required String cityName})async
  {
    try{
      Response response = await dio.get(""
          "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no"
      );
      Map<String , dynamic> data = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    }
    on DioException catch(e){
      final String error = e.response?.data["error"]["message"];
      Fluttertoast.showToast(
          msg: error,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return null;

  }
}