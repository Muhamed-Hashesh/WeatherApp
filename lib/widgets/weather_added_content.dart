import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_weather_app/cubits/weather_cubit/weather_cubit.dart';

class WeatherAddedContent extends StatelessWidget {
  const WeatherAddedContent({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${weatherModel.tempAVG.round()}°',
                style: const TextStyle(fontSize: 96, color: Colors.white),
              ),
              Text(
                weatherModel.condition,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: const Color(0xffEBEBF5).withOpacity(0.6),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'H: ${weatherModel.maxTemp.round()}°',
                    style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'L: ${weatherModel.minTemp.round()}°',
                    style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),

        // const BottomContainer(),
      ],
    );
  }
}
