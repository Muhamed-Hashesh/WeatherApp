class WeatherModel {
  final String city;
  final String region;
  final double tempAVG;
  final String condition;
  final double maxTemp;
  final double minTemp;

  WeatherModel({
    required this.city,
    required this.region,
    required this.tempAVG,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        city: json['location']['name'],
        region: json['location']['region'],
        tempAVG: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        condition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c']);
  }
}
