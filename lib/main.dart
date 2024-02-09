import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:my_weather_app/views/home_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: HomeScreenPage(),
      ),
    );
  }
}
