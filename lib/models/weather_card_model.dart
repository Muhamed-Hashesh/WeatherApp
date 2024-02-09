class WeatherCardModel {
  final DateTime hours;
  final double temp;

  WeatherCardModel({required this.hours, required this.temp});

  factory WeatherCardModel.fromJson(json) {
    return WeatherCardModel(
      hours: DateTime.parse(json['time']),
      temp: json['temp_c'],
    );
  }
}
