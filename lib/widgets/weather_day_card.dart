import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/models/weather_card_model.dart';

class WeatherDaysCard extends StatelessWidget {
  const WeatherDaysCard({
    super.key,
    required this.weatherCardModel,
  });

  final WeatherCardModel weatherCardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 146,
      decoration: BoxDecoration(
        color: const Color(0xff48319D).withOpacity(0.4),
        borderRadius: BorderRadius.circular(44),
        border: Border.all(
          color: const Color(0xff48319D),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('h a').format(weatherCardModel.hours),
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Image(
              width: 60,
              image: AssetImage('assets/clouds/Snow0.png'),
            ),
            Text(
              '${weatherCardModel.temp}°',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
