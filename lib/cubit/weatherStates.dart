import 'package:weather_app3/models/weatherModel.dart';

abstract class WeatherStates {}
class NoWeatherData extends WeatherStates{}
class WeatherLoadedData extends WeatherStates{
  final WeatherModel weatherModel;

  WeatherLoadedData(this.weatherModel);
}
class WeatherFail extends WeatherStates{}