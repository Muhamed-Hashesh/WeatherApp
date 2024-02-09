import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:my_weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:my_weather_app/views/no_weather_view.dart';
import 'package:my_weather_app/views/weather_added_view.dart';
import 'package:my_weather_app/views/weather_call_error.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            child: Image(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          BlocBuilder<GetWeatherCubit, MainState>(
            builder: ((context, state) {
              if (state is NoWeatherState) {
                return const NoWeatherScreen();
              } else if (state is WeatherAddedState) {
                return const WeatherAddedScreen();
              } else if (state is FailureScreenState) {
                return const WeatherCallError();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
