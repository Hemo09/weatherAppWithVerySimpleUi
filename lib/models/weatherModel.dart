import 'dart:core';

class WeatherModel {
  final String country;
  final DateTime date;
  final String? image;
  final double degree;
  final double maxTemp;
  final double minTemp;
  final String conditional;

  WeatherModel({required this.country,
    required this.date,
    this.image,
    required this.degree,
    required this.maxTemp,
    required this.minTemp,
    required this.conditional});

  factory WeatherModel.fromJson(json)
  {
    return WeatherModel(country: json["location"]["name"],
        date: DateTime.parse(json ["current"]["last_updated"]),
        degree: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json ["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        image:  json ["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        conditional: json ["forecast"]["forecastday"][0]["day"]["condition"]["text"]
    );
  }
}

