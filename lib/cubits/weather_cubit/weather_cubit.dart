import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:my_weather_app/models/weather_model.dart';
import 'package:my_weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<MainState> {
  GetWeatherCubit() : super(NoWeatherState());

  late final WeatherModel weatherModel;
  // late final WeatherCardModel weatherCardModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServices(Dio()).getWeather(cityName);

      // weatherCardModel = await WeatherServices(Dio()).getCardWeather(cityName);

      emit(WeatherAddedState());
    } catch (e) {
      emit(FailureScreenState());
    }
  }
}
