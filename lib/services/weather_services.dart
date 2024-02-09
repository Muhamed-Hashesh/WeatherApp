import 'package:dio/dio.dart';
import 'package:my_weather_app/models/weather_card_model.dart';
import 'package:my_weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseURL = 'https://api.weatherapi.com/v1';
  final String apiKey = '48488c0a62a54b8a96902644240602';

  const WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops! There was an error, Try later';
      throw Exception(errorMessage);
    } catch (e) {
      print(e);
      throw Exception('Oops! There was an error, Try later');
    }
  }

  Future<List<WeatherCardModel>> getCardWeather(String cityName) async {
    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1');

      List<dynamic> hours = response.data['forecast']['forecastday'][0]['hour'];
      List<WeatherCardModel> weatherCardList = [];

      for (var element in hours) {
        WeatherCardModel weatherCardModel = WeatherCardModel.fromJson(element);
        weatherCardList.add(weatherCardModel);
      }
      return weatherCardList;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops! There was an error, Try later';
      throw Exception(errorMessage);
    } catch (e) {
      print(e);
      throw Exception('Oops! There was an error, Try later');
    }
  }
}
