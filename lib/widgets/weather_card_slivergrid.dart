import 'package:flutter/widgets.dart';
import 'package:my_weather_app/models/weather_card_model.dart';
import 'package:my_weather_app/widgets/weather_day_card.dart';

class WeatherCardSliverGrid extends StatelessWidget {
  const WeatherCardSliverGrid({
    super.key,
    required this.weatherList,
  });
  final List<WeatherCardModel> weatherList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: weatherList.length,
          (context, index) {
        return Center(
          child: WeatherDaysCard(
            weatherCardModel: weatherList[index],
          ),
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisExtent: 160,
        crossAxisSpacing: 0,
      ),
    );
  }
}
