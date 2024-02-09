import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:my_weather_app/models/weather_card_model.dart';
import 'package:my_weather_app/services/weather_services.dart';
import 'package:my_weather_app/widgets/custom_sliver_appbar.dart';
import 'package:my_weather_app/widgets/weather_added_content.dart';
import 'package:my_weather_app/widgets/weather_card_slivergrid.dart';

class WeatherAddedScreen extends StatelessWidget {
  const WeatherAddedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Stack(
      children: [
        CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            CustomSliverAppBar(
              title: weatherModel.city,
              region: weatherModel.region,
              isShown: true,
            ),
            const SliverToBoxAdapter(
              child: WeatherAddedContent(),
            ),
            //!----------------------------------------------------------------
            const SliverToBoxAdapter(child: WeatherCardSliverGridBuilder()),
            //!----------------------------------------------------------------
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 400,
              ),
            )
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -30,
          child: Image.asset('assets/images/StackedBgHouse.png'),
        )
      ],
    );
  }
}

class WeatherCardSliverGridBuilder extends StatefulWidget {
  const WeatherCardSliverGridBuilder({
    super.key,
  });

  @override
  State<WeatherCardSliverGridBuilder> createState() =>
      _WeatherCardSliverGridBuilderState();
}

class _WeatherCardSliverGridBuilderState
    extends State<WeatherCardSliverGridBuilder> {
  dynamic future;
  @override
  void initState() {
    super.initState();
    String cityName =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel.city;
    future = WeatherServices(Dio()).getCardWeather(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WeatherCardModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WeatherCardSliverGrid(
              weatherList: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('data'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
