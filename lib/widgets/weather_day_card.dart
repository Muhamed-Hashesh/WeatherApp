import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/models/weather_card_model.dart';

class WeatherDaysCard extends StatelessWidget {
  const WeatherDaysCard({
    Key? key,
    required this.weatherCardModel,
  }) : super(key: key);

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
              weatherCardModel.hours != null
                  ? DateFormat('h a').format(weatherCardModel.hours)
                  : 'N/A',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Image.asset(
              getDescriptionForDay(),
              width: 60,
            ),
            Text(
              '${weatherCardModel.temp}°',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDescriptionForDay() {
    final condition = weatherCardModel.condition;

    switch (condition) {
      // ... Your existing switch cases
      case "Sunny":
        return 'assets/clouds/Sunny.png';
      case "Partly cloudy":
        return 'assets/clouds/Clouds.png';
      case "Cloudy":
        return 'assets/clouds/Clouds.png';
      case "Overcast":
        return "assets/clouds/Snow0.png";
      case "Mist":
        return 'assets/clouds/MoonClouds.png';
      case "Patchy rain possible":
        return 'assets/clouds/MoonRain.png';
      case "Patchy snow possible":
        return 'assets/clouds/MoonSnow.png';
      case "Patchy sleet possible":
        return 'assets/clouds/Rain.png';
      case 'assets/clouds/MoonSnow0.png':
        return "Possibility of scattered freezing drizzle.";
      case 'assets/clouds/MoonRain.png':
        return 'assets/clouds/Snow0.png';
      case "Blowing snow":
        return 'assets/clouds/MoonSnow.png';
      case "Blizzard":
        return 'assets/clouds/MoonRain.png';
      default:
        return 'assets/clouds/Snow0.png'; // Add a default image if the condition doesn't match any case
    }
  }
}
