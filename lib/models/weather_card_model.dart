class WeatherCardModel {
  final DateTime hours;
  final double temp;
  final String condition;

  WeatherCardModel({
    required this.hours,
    required this.temp,
    required this.condition,
  });

  factory WeatherCardModel.fromJson(json) {
    return WeatherCardModel(
      hours: DateTime.parse(json['time']),
      temp: json['temp_c'],
      condition: json['condition']['text'],
    );
  }
}
